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
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var gameButtons = [UIButton]()
    var gamePoints = 0
    
    enum GameState {
        case gameOver
        case playing
    }
    
    var state = GameState.gameOver
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pointsLabel.isHidden = true
        gameButtons = [goodButton, badButton]
        setupFreshGameState()
    }
    
    func startNewGame() {
        startGameButton.isHidden = true
        gamePoints = 0
        updatePointsLabel(gamePoints)
        pointsLabel.textColor = .magenta
        pointsLabel.isHidden = false
        oneGameRound()
    }
    
    func oneGameRound() {
        updatePointsLabel(gamePoints)
        displayRandomButton()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
            _ in if self.state == GameState.playing {
                if self.currentButton == self.goodButton {
                    self.gameOver()
                } else {
                    self.oneGameRound()
                }
            }
        }
    }

    @IBAction func startPressed(_ sender: Any) {
        state = GameState.playing
        startNewGame()
    }
    
    @IBAction func goodPressed(_ sender: Any) {
        gamePoints = gamePoints + 1
        updatePointsLabel(gamePoints)
        goodButton.isHidden = true
        timer?.invalidate()
        oneGameRound()
    }
    
    @IBAction func badPressed(_ sender: Any) {
        badButton.isHidden = true
        timer?.invalidate()
        gameOver()
    }
    
    var timer: Timer?
    var currentButton: UIButton!
    
    func displayRandomButton() {
        for myButton in gameButtons {
            myButton.isHidden = true
        }
        let buttonIndex = Int.random(in: 0..<gameButtons.count)
        currentButton = gameButtons[buttonIndex]
        currentButton.center = CGPoint(x: randomXCoordinate(), y: randomYCoordinate())
        currentButton.isHidden = false
        
        let fontSize = Int.random(in: 17..<51)
        currentButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
    
    func gameOver() {
        state = GameState.gameOver
        pointsLabel.textColor = .brown
        setupFreshGameState()
    }
    
    func setupFreshGameState() {
        startGameButton.isHidden = false
        for myButton in gameButtons {
            myButton.isHidden = true
        }
        pointsLabel.alpha = 0.15
        currentButton = goodButton
        state = GameState.gameOver
    }
    
    func randCGFloat(_ min: CGFloat, _ max: CGFloat) -> CGFloat {
        return CGFloat.random(in: min..<max)
    }
    
    func randomXCoordinate() -> CGFloat {
        let left = view.safeAreaInsets.left + currentButton.bounds.width
        let right = view.bounds.width - view.safeAreaInsets.right - currentButton.bounds.width
        return randCGFloat(left, right)
    }
    
    func randomYCoordinate() -> CGFloat {
        let top = view.safeAreaInsets.top + currentButton.bounds.height
        let bottom = view.bounds.height - view.safeAreaInsets.bottom - currentButton.bounds.height
        return randCGFloat(top, bottom)
    }
    
    func updatePointsLabel(_ newValue: Int) {
        pointsLabel.text = "\(newValue)"
    }
}

