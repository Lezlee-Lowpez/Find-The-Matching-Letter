//
//  GameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var targetLetterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    var timer: Timer!
    let gameBrain = GameBrain.shared
    
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        //        7.1 Within `letterButtonTapped`, use the game brain to process the selected letter and call `updateUI`.
        gameBrain.letterSelected(selectedLetter: sender.currentTitle!)
        updateUI()
    }
    
    
    func updateUI() {
        targetLetterLabel.text = gameBrain.targetLetter
        
        scoreLabel.text = String(gameBrain.score)
        
        secondsLabel.text = String(gameBrain.secondsRemaining)
        
        for index in 0..<letterButtons.count{
            
            let button = letterButtons[index]
            let letter = gameBrain.randomLetters[index]
            
            button.setTitle(letter, for: .normal)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameBrain.newGame(numLetters: 12)
        updateUI()
        configureTimer()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    
    func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: fireTimer(timer:))
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func fireTimer(timer: Timer) {
        gameBrain.secondsRemaining -= 1
        updateUI()
        
        if gameBrain.secondsRemaining <= 0 {
            timer.invalidate()
            self.dismiss(animated: true, completion: nil)
        
           
        }
        
    }
    
}
