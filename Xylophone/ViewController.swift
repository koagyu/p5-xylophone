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
        playSound(pitch: pitch)
    }
    
    func playSound(pitch: String) {
        player = players[pitch]!
        player.play()
    }

}

