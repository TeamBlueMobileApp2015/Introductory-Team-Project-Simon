//
//  HighscoreAdapter.swift
//  Introductory-Team-Project-Simon
//
//  Created by Ryan Dawkins on 9/13/15.
//  Copyright © 2015 Team Blue Mobile App 2015. All rights reserved.
//

import Foundation

class HighscoreAdapter {
    
    private let HIGHSCORE_STRING = "Highscore"
    private let storage = StorageFacade()
    
    func GetHighScore() -> Int {
        let stringValue = storage.getString(HIGHSCORE_STRING)
        if stringValue != "" {
            return Int(stringValue)!
        }
        else {
            return 0
        }
    }
    
    func SetHighScore(value : Int) {
        storage.setString(HIGHSCORE_STRING, value: String(value))
    }
    
}