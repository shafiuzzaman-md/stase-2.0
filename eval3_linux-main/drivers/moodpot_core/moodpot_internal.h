// SPDX-License-Identifier: GPL-2.0
/*
 * moodpot_internal.h - Internal structures and definitions for MoodPot
 *
 * Declares the internal mood state enumeration and the main structure
 * representing each MoodPot device. Also includes synchronization,
 * sensor data, and mood transition state needed for simulation and behavior
 * assignment.
 *
 * This header is private to the moodpot implementation and not exposed
 * to user-space or external modules.
 */

#ifndef _MOODPOT_INTERNAL_DEF_H
#define	_MOODPOT_INTERNAL_DEF_H

#include <linux/module.h>
#include <linux/init.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/miscdevice.h>
#include <linux/mutex.h>
#include <linux/list.h>
#include <linux/fs.h>
#include <linux/bug.h>
#include <linux/kheap.h>
#include <linux/moodpot_core.h>

/* Enumerated mood states representing plant behavior */
enum mood_state {
    MOOD_IDLE = 0,
    MOOD_NEED_WATER,
    MOOD_DROWNED,
    MOOD_BLIND,
    MOOD_LONELY,
    MOOD_CROWDED,
    MOOD_COLD,
    MOOD_HOT,
    MOOD_STUNNED,
    MOOD_CURIOUS,
    MOOD_FREAKED_OUT,
    MOOD_GRATEFUL,
    MOOD_RESIGNED,
    MOOD_PARANOID,
    MOOD_REBELLIOUS,
    MOOD_JOYFUL,
    MOOD_FATALISTIC,
    MOOD_UNDERWORLD_ACCESS,
    MOOD_TOTAL
};


/**
 * struct moodpot_device - Simulated smart planter device
 * @id: Unique pot identifier
 * @moisture, light, proximity, temperature, vibration: Sensor fields
 * @current_mood: Active mood state
 * @mood_action: Function pointer for behavior handler
 * @stable_cycles: Consecutive cycles with neutral inputs
 * @gpio: Output controls (pump, buzzer)
 * @mood_desc: Descriptive label for current mood
 * @response_buf: Formatted output response for last update
 * @response_len: Length of response buffer contents
 * @lock: Per-device synchronization
 * @list: Linked list node for global device list
 */
struct moodpot_device {
    int id;
    uint16_t moisture, light, proximity, temperature, vibration;
    enum mood_state current_mood;
    void (*mood_action)(struct moodpot_device *dev);
    uint8_t stable_cycles;
    struct {
        bool pump;
        bool buzzer;
    } gpio;
    char mood_desc[MOOD_LEN];
    char response_buf[MOODPOT_RESP_MAX];
    size_t response_len;
    struct mutex lock;
    struct list_head list;
};

#endif  /* _MOODPOT_INTERNAL_H */
