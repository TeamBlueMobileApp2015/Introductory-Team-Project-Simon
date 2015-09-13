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
    
    func GetHighScore() -> String {
        return storage.getString(HIGHSCORE_STRING)
    }
    
    func SetHighScore(value : Int) {
        storage.setString(HIGHSCORE_STRING, value: String(value))
    }
    
}