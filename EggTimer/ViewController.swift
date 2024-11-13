//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]

    var secondsRemaining = 60

    var timer = Timer()




    @IBAction func keyPressed(_ sender: UIButton) {

        timer.invalidate()

        let hardness = sender.currentTitle!  //Soft, Medium, Hard
            secondsRemaining = eggTimes[hardness]! // 300, 420, 720

        //Countdown of seconds to cook
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)


    }

    @objc func updateCounter() {
        //functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds to cook.")
            secondsRemaining -= 1
        } 
    }


}






