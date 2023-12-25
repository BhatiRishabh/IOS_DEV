//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var TextView: UILabel!
    let eggTimes=["Soft": 180, "Medium": 420, "Hard": 720]
    var timer=Timer()
    var secondsRemaining=60
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        TextView.text=hardness
        secondsRemaining=eggTimes[hardness]!
        //        print(secondsRemaining)
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining -= 1
                self.progressBar.progress=(Float(self.eggTimes[hardness]!)-Float(self.secondsRemaining))/Float(self.eggTimes[hardness]!)
            } else {
                self.TextView.text="Done!"
                self.playSound()
                Timer.invalidate()
            }
        }
        
        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
