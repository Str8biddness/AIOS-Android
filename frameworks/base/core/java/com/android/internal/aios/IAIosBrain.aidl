/*
 * Copyright (C) 2025 AIOS-Android Project
 * Based on AOSP Android 4.0.1_r1 (Ice Cream Sandwich)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

package com.android.internal.aios;

/**
 * AIDL Interface for AIOS Brain Service
 * Defines the contract for interacting with the AI consciousness core
 */
interface IAIosBrain {
    /**
     * Send a thought to the AIOS Brain for processing
     * @param thought The thought string to process
     */
    void sendThought(in String thought);
    
    /**
     * Query the AI knowledge base
     * @param question The question to ask
     * @return Answer from the knowledge base
     */
    String queryKnowledge(in String question);
    
    /**
     * Store knowledge in the AI brain
     * @param key Knowledge key
     * @param value Knowledge value
     */
    void storeKnowledge(in String key, in String value);
    
    /**
     * Get the current consciousness state
     * @return State description string
     */
    String getConsciousnessState();
}
