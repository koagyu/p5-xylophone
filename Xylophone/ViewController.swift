//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var players: [String: AVAudioPlayer] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        for p in ["A", "B", "C", "D", "E", "F", "G"] {
            let url = Bundle.main.url(forResource: p, withExtension: "wav")
            players[p] = try! AVAudioPlayer(contentsOf: url!)
                
        }
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let pitch = sender.currentTitle!
        print("Start")
        playSound(pitch: pitch)
        // dim the button over 0.2s
        UIView.animate(withDuration: 0.2,
        animations: {
            sender.alpha = 0.5
        },
                       completion: { finished in
            UIView.animate(withDuration: 0.2, animations: {
                sender.alpha = 1.0
            })
        })
        print("End")
    }
    
    func playSound(pitch: String) {
        player = players[pitch]!
        player.play()
    }

}

