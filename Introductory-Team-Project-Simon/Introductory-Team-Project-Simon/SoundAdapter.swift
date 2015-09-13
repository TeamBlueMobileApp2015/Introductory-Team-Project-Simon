//
//  SoundAdapter.swift
//  Introductory-Team-Project-Simon
//
//  Created by Ryan Dawkins on 9/13/15.
//  Copyright © 2015 Team Blue Mobile App 2015. All rights reserved.
//

import Foundation
import AVFoundation

class SoundAdapter {
    
    private var redPlayer = AVAudioPlayer()
    private var greenPlayer = AVAudioPlayer()
    private var bluePlayer = AVAudioPlayer()
    private var yellowPlayer = AVAudioPlayer()
    
    init() {
        
        let blueSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tone-A", ofType: "wav")!)
        do { try bluePlayer = AVAudioPlayer(contentsOfURL: blueSound) } catch {}
        bluePlayer.prepareToPlay()
        
        let redSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tone-B", ofType: "wav")!)
        do { try redPlayer = AVAudioPlayer(contentsOfURL: redSound) } catch {}
        redPlayer.prepareToPlay()
        
        let greenSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tone-C", ofType: "wav")!)
        do { try greenPlayer = AVAudioPlayer(contentsOfURL: greenSound) } catch {}
        greenPlayer.prepareToPlay()
        
        let yellowSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tone-D", ofType: "wav")!)
        do { try yellowPlayer = AVAudioPlayer(contentsOfURL: yellowSound) } catch {}
        yellowPlayer.prepareToPlay()
    }
    
    func PlaySound(button : Int) {
        
        switch button {
        case ViewController.Buttons.Blue.rawValue:
            bluePlayer.play()
            break
        case ViewController.Buttons.Green.rawValue:
            greenPlayer.play()
            break
        case ViewController.Buttons.Red.rawValue:
            redPlayer.play()
            break
        case ViewController.Buttons.Yellow.rawValue:
            yellowPlayer.play()
            break
        default:
            break
        }
        
    }
    
}