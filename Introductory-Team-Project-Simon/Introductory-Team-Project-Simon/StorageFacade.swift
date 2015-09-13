//
//  StorageFacade.swift
//  Introductory-Team-Project-Simon
//
//  Created by Ryan Dawkins on 9/13/15.
//  Copyright © 2015 Team Blue Mobile App 2015. All rights reserved.
//

import Foundation

class StorageFacade {
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    func getString(key : String) -> String {
        return (self.defaults.valueForKey(key)?.string)!
    }
    
    func setString(key : String, value : String) {
        self.defaults.setValue(value: value, forKey: key)
        self.defaults.synchronize()
    }
    
}