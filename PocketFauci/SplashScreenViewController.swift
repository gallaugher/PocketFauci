//
//  SplashScreenViewController.swift
//  PocketFauci
//
//  Created by John Gallaugher on 11/23/20.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "corona")
        
        appNameLabel.alpha = 0.0
        imageView.frame.origin.y = self.view.frame.height
        UIView.animate(withDuration: 1.0, animations: {self.imageView.frame.origin.y = 0})
        UIView.animateKeyframes(withDuration: 1.0, delay: 1.0, animations: {self.appNameLabel.alpha = 1.0})
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                audioPlayer = try AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: Data in \(name) could not be played as a sound.")
            }
        } else {
            print("😡 ERROR: Could not read data from file named: \(name)")
        }
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ShowTableVivew", sender: nil)
    }
    
}
