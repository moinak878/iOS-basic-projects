//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//     let softTime = 5,mediumTime = 8,hardTime = 12
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    let eggTimes = ["Soft" : 5 , "Medium" : 8 , "Hard" : 12]

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    

//        let hardness = sender.currentTitle!
       
//        if hardness=="Soft"{
//            print(softTime)
//        }
//        else if hardness=="Medium"{
//            print(mediumTime)
//        }
//        else{
//            print(hardTime)
//        }
//        print(eggTimes[hardness]!)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ProgressBar.transform = ProgressBar.transform.scaledBy(x: 1, y: 2)
        ProgressBar.progress = 0.0
    }

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        totalTime = eggTimes[sender.currentTitle!]!
        secondsPassed = 0
        ProgressBar.progress = 0.0
         titleLabel.text = sender.currentTitle!
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if(secondsPassed<totalTime){
            secondsPassed+=1
            ProgressBar.progress =  Float(secondsPassed)/Float(totalTime)
        }
        else{
             titleLabel.text = "DONE!"
        }
            
    }
    
}
