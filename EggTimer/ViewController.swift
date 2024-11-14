//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {


    let eggTimes = ["Soft": 30, "Medium": 42, "Hard": 72]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?


    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    

    @IBAction func keyPressed(_ sender: UIButton) {

        timer.invalidate()
        let hardness = sender.currentTitle!  //Soft, Medium, Hard
        totalTime = eggTimes[hardness]! // 30, 42, 72
        progressBar.progress = 0.0  //reset progress bar to zero
        secondsPassed = 0            //reset to zero
        textLabel.text = hardness    //display which one we picked

        //Countdown of seconds to cook
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }

    @objc func updateCounter() {

        //functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            print("\(secondsPassed) seconds to cook.")
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else{
            timer.invalidate()
            textLabel.text = "DONE!"
            playSound()
        }
    }


    func playSound() {
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }


}






