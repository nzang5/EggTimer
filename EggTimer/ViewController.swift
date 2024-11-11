//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func keyPressed(_ sender: UIButton) {

        let eggTimes = [
            "Soft": 5*60,
            "Medium": 7*60,
            "Hard": 12*60
        ]

        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!

        switch hardness{
        case "Soft":
            print(result)
        case "Medium":
            print(result)
        case "Hard":
            print(result)
        default:
            print("Error")
        }
    }





}
