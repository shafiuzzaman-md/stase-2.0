// SPDX-License-Identifier: GPL-2.0
/*
 * moodpot_behaviors.h - Mood behavior interface for MoodPot simulation
 *
 * Declares the interface for retrieving behavior handlers based on mood state.
 * Each mood handler corresponds to a function that modifies the internal state
 * of a MoodPot device according to its emotional context.
 *
 * This interface is used by the core logic to assign function pointers dynamically.
 */

#ifndef _MOODPOT_BEHAVIORS_H
#define _MOODPOT_BEHAVIORS_H

struct moodpot_device;

/* Function pointer type for mood handler functions */
typedef void (*mood_fn)(struct moodpot_device *);

/**
 * get_mood_handler - Retrieve behavior function for a given mood
 * @mood: mood state identifier
 *
 * Return: pointer to handler function or NULL if invalid
 */
mood_fn get_mood_handler(enum mood_state mood);

#endif /* _MOODPOT_BEHAVIORS_H */