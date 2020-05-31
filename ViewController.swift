//
//  ViewController.swift
//  EggTimer
//
//  Created by Vivek
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
     let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720]
     var timer = Timer()
     var player: AVAudioPlayer!
     var totalTime = 0
     var secondsPassed = 0
     
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
       
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        self.progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
    
      
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
        if self.secondsPassed < self.totalTime {
          self.secondsPassed += 1
          self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
          print(self.progressBar.progress)
            
        }
        else {
            self.timer.invalidate()
            self.titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            self.player = try! AVAudioPlayer(contentsOf: url!)
            self.player.play()
            
            
        }
        }
        
        
    }
    
}
