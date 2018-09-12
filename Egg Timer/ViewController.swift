//
//  ViewController.swift
//  Egg Timer
//
//  Created by Charles Martin Reed on 9/11/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

//NOTE TO SELF: I should really be using didSet for updating the labels...

import UIKit

class ViewController: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet weak var secondsLabel: UILabel!
    
    //creating our timer
    var seconds = 210
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondsLabel.text = String(seconds)
        
        
        //setting up the nav bar
        navigationItem.title = "Egg Timer"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(stopTimer))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(startTimer))
    }
    
    @objc func stopTimer() {
        timer.invalidate()
        navigationItem.title = "Timer Paused!"
    }
    
    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownTimer), userInfo: nil, repeats: true)
        
        navigationItem.title = "Timer Running!"
    }
    
    @objc func countdownTimer() {
        if seconds > 0 {
            seconds -= 1
            secondsLabel.text = String(seconds)
        } else {
            timer.invalidate()
        }
    }

    @IBAction func minusTenSeconds(_ sender: Any) {
        if seconds > 10 {
            seconds -= 10
            secondsLabel.text = String(seconds)
        } else {
            return
        }
    }
    
    @IBAction func plusTenSeconds(_ sender: Any) {
        
        seconds += 10
        secondsLabel.text = String(seconds)
    }
    
    @IBAction func resetSeconds(_ sender: Any) {
    
        seconds = 210
        secondsLabel.text = String(seconds)
    }
    
    
}

