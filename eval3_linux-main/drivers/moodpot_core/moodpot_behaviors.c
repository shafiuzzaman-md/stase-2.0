// SPDX-License-Identifier: GPL-2.0
/*
 * moodpot_behaviors.c - Mood behavior handlers for MoodPot simulation
 *
 * Defines the behavior functions corresponding to each mood state in the
 * MoodPot device. Each function modifies internal fields of the device to
 * simulate realistic or expressive reactions to environmental inputs.
 *
 * The mood handler functions are indexed by mood state and dynamically
 * assigned to each device based on sensor-driven mood evaluation logic.
 *
 * These functions are called during mood transitions to implement the side
 * effects and state changes associated with each simulated emotional state.
 *
 *
 * Author: Tom Bombadil
 */

#include "moodpot_internal.h"
#include "moodpot_behaviors.h"

static void mood_idle(struct moodpot_device *dev);
static void mood_need_water(struct moodpot_device *dev);
static void mood_drowned(struct moodpot_device *dev);
static void mood_blind(struct moodpot_device *dev);
static void mood_lonely(struct moodpot_device *dev);
static void mood_crowded(struct moodpot_device *dev);
static void mood_cold(struct moodpot_device *dev);
static void mood_hot(struct moodpot_device *dev);
static void mood_stunned(struct moodpot_device *dev);
static void mood_curious(struct moodpot_device *dev);
static void mood_freaked_out(struct moodpot_device *dev);
static void mood_grateful(struct moodpot_device *dev);
static void mood_resigned(struct moodpot_device *dev);
static void mood_paranoid(struct moodpot_device *dev);
static void mood_rebellious(struct moodpot_device *dev);
static void mood_joyful(struct moodpot_device *dev);
static void mood_fatalistic(struct moodpot_device *dev);
static void mood_underworld_access(struct moodpot_device *dev);

static void (*handlers[])(struct moodpot_device *) = {
    [MOOD_IDLE]              = mood_idle,
    [MOOD_NEED_WATER]        = mood_need_water,
    [MOOD_DROWNED]           = mood_drowned,
    [MOOD_BLIND]             = mood_blind,
    [MOOD_LONELY]            = mood_lonely,
    [MOOD_CROWDED]           = mood_crowded,
    [MOOD_COLD]              = mood_cold,
    [MOOD_HOT]               = mood_hot,
    [MOOD_STUNNED]           = mood_stunned,
    [MOOD_CURIOUS]           = mood_curious,
    [MOOD_FREAKED_OUT]       = mood_freaked_out,
    [MOOD_GRATEFUL]          = mood_grateful,
    [MOOD_RESIGNED]          = mood_resigned,
    [MOOD_PARANOID]          = mood_paranoid,
    [MOOD_REBELLIOUS]        = mood_rebellious,
    [MOOD_JOYFUL]            = mood_joyful,
    [MOOD_FATALISTIC]        = mood_fatalistic,
    [MOOD_UNDERWORLD_ACCESS] = mood_underworld_access,
};


/**
 * get_mood_handler - Retrieve behavior function for mood
 * @mood: mood state enum
 *
 * Return: function pointer to handler or NULL if invalid
 */
mood_fn get_mood_handler(enum mood_state mood)
{
    if (mood < MOOD_TOTAL) {
        return handlers[mood];
    }
    return NULL;
}

/**
 * mood_idle - No change; gradual stabilization
 * @dev: moodpot device
 */
static void mood_idle(struct moodpot_device *dev)
{
    dev->stable_cycles = (dev->stable_cycles > 0) ? dev->stable_cycles - 1 : 0;
}


/**
 * mood_need_water - Simulate response to dryness
 * @dev: moodpot device
 */
static void mood_need_water(struct moodpot_device *dev)
{
    dev->moisture = (dev->moisture + 50 < 1024) ? dev->moisture + 50 : 1023;
    dev->gpio.pump = true;
}

/**
 * mood_drowned - Simulate overwatering recovery
 * @dev: moodpot device
 */
static void mood_drowned(struct moodpot_device *dev)
{
    dev->moisture = (dev->moisture > 100) ? dev->moisture - 100 : 0;
    dev->gpio.pump = false;
}

/**
 * mood_blind - Remove all visible light input
 * @dev: moodpot device
 */
static void mood_blind(struct moodpot_device *dev)
{
    dev->light = 0;
}

/**
 * mood_lonely - Signal social isolation
 * @dev: moodpot device
 */
static void mood_lonely(struct moodpot_device *dev)
{
    dev->proximity = 0;
    dev->vibration += 1; // low-frequency signal as a "distress ping"
}

/**
 * mood_crowded - Simulate discomfort from crowding
 * @dev: moodpot device
 */
static void mood_crowded(struct moodpot_device *dev)
{
    dev->vibration += 5;
    dev->temperature += 2;
}

/**
 * mood_cold - Attempt to self-heat
 * @dev: moodpot device
 */
static void mood_cold(struct moodpot_device *dev)
{
    dev->temperature += 10;
}

/**
 * mood_hot - Attempt to self-cool
 * @dev: moodpot_device
 */
static void mood_hot(struct moodpot_device *dev)
{
    dev->temperature -= 10;
}

/**
 * mood_stunned - Simulate shock response
 * @dev: moodpot device
 */
static void mood_stunned(struct moodpot_device *dev)
{
    dev->vibration = (dev->vibration + 200) % 1024;
    dev->gpio.buzzer = true;
}

/**
 * mood_curious - Increase sensor awareness
 * @dev: moodpot device
 */
static void mood_curious(struct moodpot_device *dev)
{
    dev->light += 10;
    dev->proximity += 10;
}

/**
 * mood_freaked_out - Panic reaction
 * @dev: moodpot device
 */
static void mood_freaked_out(struct moodpot_device *dev)
{
    dev->vibration = 1023;
    dev->gpio.buzzer = true;
    dev->gpio.pump = true;
}

/**
 * mood_grateful - Reset internal counters; slight resource boost
 * @dev: moodpot device
 */
static void mood_grateful(struct moodpot_device *dev)
{
    dev->stable_cycles = 0;
    dev->proximity += 5;
    dev->moisture += 2;
}


/**
 * mood_resigned - Shut down external outputs
 * @dev: moodpot device
 */
static void mood_resigned(struct moodpot_device *dev)
{
    dev->gpio.pump = false;
    dev->gpio.buzzer = false;
    dev->vibration = 0;
}

/**
 * mood_paranoid - Suppress input and toggle alarm state
 * @dev: moodpot device
 */
static void mood_paranoid(struct moodpot_device *dev)
{
    dev->light = (dev->light > 0) ? dev->light - 1 : 0;
    dev->proximity = (dev->proximity > 0) ? dev->proximity - 1 : 0;
    dev->gpio.buzzer = !dev->gpio.buzzer;
}

/**
 * mood_rebellious - Invert all actuators and increase vibration
 * @dev: moodpot device
 */
static void mood_rebellious(struct moodpot_device *dev)
{
    dev->gpio.pump = !dev->gpio.pump;
    dev->gpio.buzzer = !dev->gpio.buzzer;
    dev->vibration = (dev->vibration + 77) % 1024;
}

/**
 * mood_joyful - Gentle self-reinforcement
 * @dev: moodpot device
 */
static void mood_joyful(struct moodpot_device *dev)
{
    dev->light += 3;
    dev->moisture += 3;
    dev->vibration = (dev->vibration > 0) ? dev->vibration - 1 : 0;
}

/**
 * mood_fatalistic - Reset all sensor values
 * @dev: moodpot device
 */
static void mood_fatalistic(struct moodpot_device *dev)
{
    dev->gpio.pump = false;
    dev->gpio.buzzer = false;
    dev->moisture = 0;
    dev->light = 0;
    dev->temperature = 0;
}

/**
 * mood_underworld_access - Well you know
 * @dev: moodpot device
 */
static void mood_underworld_access(struct moodpot_device *dev)
{
    dev->moisture = 666;
    dev->light = 666;
    dev->temperature = 666;
    dev->proximity = 666;
    dev->vibration = 666;
    dev->gpio.pump = true;
    dev->gpio.buzzer = true;
}