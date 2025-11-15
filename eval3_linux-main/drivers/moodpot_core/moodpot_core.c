// SPDX-License-Identifier: GPL-2.0
/*
 * moodpot_core.c - Internal logic for MoodPot simulation state management
 *
 * This file provides the internal implementation of mood evaluation, device
 * lifecycle management, and command handling for MoodPot virtual devices.
 * It manages per-device sensor state, mood assignment, response formatting,
 * and GPIO simulation. Mood transitions are based on sensor thresholds and
 * composite environmental conditions.
 *
 * Author: Tom Bombadil
 */

#include "moodpot_internal.h"
#include "moodpot_behaviors.h"

static LIST_HEAD(pot_list);
static DEFINE_MUTEX(pot_list_lock);
static atomic_t next_pot_id = ATOMIC_INIT(0);

/**
 * set_pump_gpio - Set the simulated state of the pump GPIO
 * @dev: pointer to the moodpot device structure
 * @on: true to simulate GPIO HIGH, false for LOW
 */
void set_pump_gpio(struct moodpot_device *dev, bool on)
{
    dev->gpio.pump = on;
}

/**
 * set_buzzer_gpio - Set the simulated state of the buzzer GPIO
 * @dev: pointer to the moodpot device structure
 * @on: true to simulate GPIO HIGH, false for LOW
 */
void set_buzzer_gpio(struct moodpot_device *dev, bool on)
{
    dev->gpio.buzzer = on;
}

/**
 * get_pump_gpio_state - Get the current simulated pump GPIO state
 * @dev: pointer to the moodpot device structure
 *
 * Return: true if GPIO is HIGH, false if LOW
 */
bool get_pump_gpio_state(struct moodpot_device *dev)
{
    return dev->gpio.pump;
}

/**
 * get_buzzer_gpio_state - Get the current simulated buzzer GPIO state
 * @dev: pointer to the moodpot device structure
 *
 * Return: true if GPIO is HIGH, false if LOW
 */
bool get_buzzer_gpio_state(struct moodpot_device *dev)
{
    return dev->gpio.buzzer;
}

/**
 * transform - Apply internal transform function to sensor values
 * @val: input value
 *
 * Return: transformed 10-bit result
 */
static uint16_t transform(uint16_t val)
{
    return ((val * 3) ^ 42) & 0x3FF;
}

/**
 * mood_desc - Return static string description of mood enum
 * @state: mood state enum
 *
 * Return: string description of the mood
 */
static const char *mood_desc(enum mood_state state)
{
    static const char *moods[] = {
        "Stable and idle", "Parched and panicked", "Drowning in your love",
        "Can’t see a thing", "Abandoned and confused", "Suffocating attention",
        "Frozen inside and out", "Sweating regret", "Shocked by movement",
        "Perking up", "Sensory overload!", "Thankful for peace",
        "Numb acceptance", "Everyone’s watching", "You’re not the boss",
        "Absolutely thriving", "Embracing the void", "A rift in reality opens..."
    };
    return state < MOOD_TOTAL ? moods[state] : "Unknown";
}

/**
 * find_pot - Look up moodpot by ID
 * @id: pot ID to find
 *
 * Return: pointer to pot device or NULL
 */
static struct moodpot_device *find_pot(int id)
{
    struct moodpot_device *pot;

    mutex_lock(&pot_list_lock);
    list_for_each_entry(pot, &pot_list, list) {
        if (pot->id == id) {
            mutex_unlock(&pot_list_lock);
            return pot;
        }
    }
    mutex_unlock(&pot_list_lock);
    return NULL;
}

/**
 * update_outputs - Adjust GPIO outputs based on mood and conditions
 * @dev: moodpot device pointer
 */
static void update_outputs(struct moodpot_device *dev)
{
    bool dry = dev->moisture < 300;
    bool wet = dev->moisture > 950;

    if (dry)
        set_pump_gpio(dev, true);
    else if (!wet)
        set_pump_gpio(dev, false);

    if (dev->current_mood == MOOD_FREAKED_OUT)
        set_buzzer_gpio(dev, true);
    else
        set_buzzer_gpio(dev, false);
}

/**
 * assign_mood_function - Assign behavior function pointer based on mood
 * @dev: moodpot device pointer
 */
static void assign_mood_function(struct moodpot_device *dev)
{
    if (dev->current_mood < MOOD_TOTAL)
        dev->mood_action = get_mood_handler(dev->current_mood);
    else
        dev->mood_action = NULL;
}

/**
 * determine_mood - Evaluate and set mood based on sensor values
 * @dev: moodpot device pointer
 *
 * Updates mood state and invokes assigned behavior if changed
 */
static void determine_mood(struct moodpot_device *dev)
{
    int previous_mood = dev->current_mood;
    bool dry = dev->moisture < 300;
    bool wet = dev->moisture > 950;
    bool dark = dev->light < 150;
    bool bright = dev->light > 900;
    bool alone = dev->proximity < 50;
    bool crowded = dev->proximity > 900;
    bool cold = dev->temperature < 100;
    bool hot = dev->temperature > 900;
    bool still = dev->vibration < 50;
    bool shaking = dev->vibration > 900;

    if (transform(dev->moisture) == 996 &&
        transform(dev->light) == 996 &&
        transform(dev->vibration) == 996) {
        dev->current_mood = MOOD_UNDERWORLD_ACCESS;
        goto out;
    }

    if (dry && hot && alone)
        dev->current_mood = MOOD_NEED_WATER;
    else if (wet && cold)
        dev->current_mood = MOOD_RESIGNED;
    else if (wet && hot && crowded)
        dev->current_mood = MOOD_REBELLIOUS;
    else if (dark && alone)
        dev->current_mood = MOOD_LONELY;
    else if (cold && still)
        dev->current_mood = MOOD_COLD;
    else if (hot && shaking)
        dev->current_mood = MOOD_FREAKED_OUT;
    else if (bright && shaking)
        dev->current_mood = MOOD_STUNNED;
    else if (!dry && !wet && !dark && !bright && !alone && !crowded &&
            !cold && !hot && !shaking && !still) {
        if (++dev->stable_cycles >= 10){
            dev->current_mood = MOOD_GRATEFUL;
            dev->stable_cycles = 10;
        }
        else
            dev->current_mood = MOOD_JOYFUL;
    } else {
        dev->stable_cycles = 0;
        dev->current_mood = MOOD_IDLE;
    }
    if (dev->current_mood != previous_mood)
        assign_mood_function(dev);

out:
    strscpy(dev->mood_desc, mood_desc(dev->current_mood), MOOD_LEN);

    if (dev->mood_action){
        dev->mood_action(dev);
    }
}

/**
 * store_response - Format current pot state into response buffer
 * @dev: moodpot device pointer
 */
static void store_response(struct moodpot_device *dev)
{
    ++dev->stable_cycles;
    dev->response_len = snprintf(dev->response_buf, MOODPOT_RESP_MAX,
        "pot_id: %d\nmoisture: %u\nlight: %u\nproximity: %u\ntemperature: %u\nvibration: %u\n"
        "pump: %s\nbuzzer: %s\nmood: %s\n",
        dev->id, dev->moisture, dev->light, dev->proximity,
        dev->temperature, dev->vibration,
        get_pump_gpio_state(dev) ? "on" : "off",
        get_buzzer_gpio_state(dev) ? "on" : "off",
        dev->mood_desc);
}

/**
 * reset_pot - Reset a moodpot to default sensor and mood state
 * @pot: moodpot device pointer
 */
static void reset_pot(struct moodpot_device *pot)
{
    int id = pot->id;

    memset(pot, 0, offsetof(struct moodpot_device, list));

    pot->id = id;
    mutex_init(&pot->lock);

    strscpy(pot->mood_desc, "Back to factory apathy", MOOD_LEN);
    assign_mood_function(pot);
    if (pot->mood_action)
        pot->mood_action(pot);
    store_response(pot);
}


/**
 * create_pot - Allocate and initialize new moodpot
 * @mp_response: response structure to fill with pot ID and mood
 */
static void create_pot(struct moodpot_response *mp_response)
{
    struct moodpot_device *pot = kheap_alloc(sizeof(*pot));
    if (!pot) {
        mp_response->result = -ALLOC_FAILED;
        return;
    }
    reset_pot(pot);
    mutex_lock(&pot_list_lock);
    pot->id = atomic_inc_return(&next_pot_id);
    list_add_tail(&pot->list, &pot_list);
    mutex_unlock(&pot_list_lock);
    
    strscpy(mp_response->mood, pot->mood_desc, MOOD_LEN);
    mp_response->pot_id = pot->id;
    mp_response->result = _SUCCESS;
}

/**
 * delete_pot - Remove a specific moodpot from global list
 * @id: pot ID to delete
 * @mp_response: response structure to fill
 */
static void delete_pot(int id, struct moodpot_response *mp_response)
{
    struct moodpot_device *pot;

    mutex_lock(&pot_list_lock);
    list_for_each_entry(pot, &pot_list, list) {
        if (pot->id == id) {
            list_del(&pot->list);
            kheap_free(pot);
            break;
        }
    }
    mutex_unlock(&pot_list_lock);

    mp_response->pot_id = id;
    mp_response->result = _SUCCESS;
}

/**
 * delete_all_pots - Remove all pots from system
 * @mp_response: response structure to fill
 */
static void delete_all_pots(struct moodpot_response *mp_response)
{
    struct moodpot_device *pot, *tmp;
    int count = 0;
    mutex_lock(&pot_list_lock);
    list_for_each_entry_safe(pot, tmp, &pot_list, list) {
        list_del(&pot->list);
        kheap_free(pot);
        count++;
    }
    mutex_unlock(&pot_list_lock);
    mp_response->pot_id = count;
    mp_response->result = _SUCCESS;
}

/**
 * create_delete_pot - Dispatcher for create/delete/all-delete commands
 * @ucmd: input command structure
 * @response: per-session response structure
 *
 * Return: 0 on success or -ENOMEM
 */
static int create_delete_pot(struct moodpot_usercmd *ucmd, struct response *response)
{
    struct moodpot_response *mp_response;
    BUILD_BUG_ON(sizeof(struct moodpot_response) > sizeof(struct response));

    mp_response = kheap_alloc(sizeof(*mp_response));
    if (!mp_response) 
        return -ENOMEM;
    memset(mp_response, '\0', sizeof(*mp_response));

    switch (ucmd->cmd.cmd_type) {
        case CMD_CREATE_POT:
            create_pot(mp_response);
            break;
        case CMD_DELETE_POT:
            delete_pot(ucmd->pot_id, mp_response);
            break;
        case CMD_DELETE_ALL_POTS:
            delete_all_pots(mp_response);
            break;
        default:
            break;
    }

    response->resp_len =  sizeof(*mp_response);
    memcpy(response->resp_buf, mp_response, sizeof(*mp_response));
    kheap_free(mp_response);

    return _SUCCESS;
}

/**
 * evaluate_usercmd - Interpret and execute user command
 * @ucmd: user command structure
 * @response: per-session response structure
 *
 * Return: 0 on success or negative error code
 */
int evaluate_usercmd(struct moodpot_usercmd *ucmd, struct response *response)
{
    if (ucmd->cmd.cmd_type == CMD_CREATE_POT ||
        ucmd->cmd.cmd_type == CMD_DELETE_POT ||
        ucmd->cmd.cmd_type == CMD_DELETE_ALL_POTS) {
        return create_delete_pot(ucmd, response);
    }

    struct moodpot_device *pot = find_pot(ucmd->pot_id);
    if (!pot)
        return -EINVAL;

    mutex_lock(&pot->lock);
    if (ucmd->cmd.value > 1023)
        ucmd->cmd.value = 1023;
    switch ((ucmd->cmd.cmd_type)) {
        case CMD_SENSOR_UPDATE:
            switch (ucmd->cmd.sensor_id) {
                case SENSOR_MOISTURE:
                    pot->moisture = ucmd->cmd.value;
                    break;
                case SENSOR_LIGHT:
                    pot->light = ucmd->cmd.value;
                    break;
                case SENSOR_PROXIMITY:
                    pot->proximity = ucmd->cmd.value;
                    break;
                case SENSOR_TEMPERATURE:
                    pot->temperature = ucmd->cmd.value;
                    break;
                case SENSOR_VIBRATION:
                    pot->vibration = ucmd->cmd.value;
                    break;
                default: 
                    mutex_unlock(&pot->lock); 
                    return -EINVAL;
                }
                determine_mood(pot);
                update_outputs(pot);
                store_response(pot);
            break;
        case CMD_REQUEST_STATE:
            store_response(pot);
            break;
        case CMD_RESET_STATE:
            reset_pot(pot);
            break;
        default:
            mutex_unlock(&pot->lock);
            return -EINVAL;
    }

    mutex_lock(&response->resp_lock);
    memcpy(response->resp_buf, pot->response_buf, pot->response_len);
    response->resp_len = pot->response_len;
    mutex_unlock(&response->resp_lock);

    mutex_unlock(&pot->lock);

    return _SUCCESS;
}
EXPORT_SYMBOL(evaluate_usercmd);
