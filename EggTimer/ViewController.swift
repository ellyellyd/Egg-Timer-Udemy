//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    */
    
    var runCount = 60
    var timeStart = 0
    var timer = Timer() //code of timer in variable
    
    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var header: UILabel!
    @IBAction func eggSelected(_ sender: UIButton) {
     
        timer.invalidate() //stop the timer
        
        let hardness = sender.currentTitle!
        timeStart = eggTime[hardness]!
        runCount = eggTime[hardness]!//! for check nil
      
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        ProgressBar.progress = 0.0
        // let result = eggTime[sender.currentTitle!]!
        
        //print(sender.currentTitle!)
        //print(result)
        //print(eggTime[sender.currentTitle!])
        //print(eggTime[sender.currentTitle!]!)
    }
        
        /*
        switch sender.currentTitle{
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            break
        }
        */
       /*
        if sender.currentTitle == "Soft"{
            print(softTime)
        }
        if sender.currentTitle == "Medium"{
            print(mediumTime)
        }
        if sender.currentTitle == "Hard"{
            print(hardTime)
        }
        */
    @objc func    updateTimer(){
        if runCount > 0{
            print("\(runCount) seconds")
            runCount -= 1
            ProgressBar.progress = ProgressBar.progress + (Float(100) / Float(timeStart) / 100)
            //ProgressBar.progress = (Float(timeStart) - Float(runCount)).truncatingRemainder(dividingBy: Float(100))
            print(ProgressBar.progress)
        }
        else{
            timer.invalidate()
            header.text = "DONE!\n How do you like your eggs?"
        }
    }
}
