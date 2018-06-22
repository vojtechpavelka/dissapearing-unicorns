//
//  ViewController.swift
//  dissapearing-unicorns
//
//  Created by Vojtěch Pavelka on 22.06.18.
//  Copyright © 2018 Vojtěch Pavelka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var gameButtons = [UIButton]()
    var gamePoints = 0
    
    enum GameState {
        case gameOver
        case playing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pointsLabel.isHidden = true
        gameButtons = [goodButton, badButton]
    }

    @IBAction func startPressed(_ sender: Any) {
    }
    
    @IBAction func goodPressed(_ sender: Any) {
    }
    
    @IBAction func badPressed(_ sender: Any) {
    }
    
}

