//
//  GameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

class GameViewController: UIViewController {
    
    
    
    var targetLetter = ""
    var randomLetters = [String]()
    var score = 0
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    @IBOutlet weak var theScoreLabel: UILabel!
    @IBOutlet weak var titleLetter: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        calculateNewScore(selectedLetter: sender.currentTitle!)
        updateScoreLabel()
        newRound()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        targetLetter = letters.randomElement()!
        
       randomLetters = generateRandomLetters(numLetters: 12)
        
        updateTargetLetterLabel()
        updateLetterButtons()
    }
    
    func generateRandomLetters(numLetters: Int) -> [String] {
        // it needs to include the target letter
        // The order should be random
        // needs to have 12 letters
        
        var myArray: [String] = [targetLetter]
        
        while myArray.count < numLetters {
            //get random letter
            let randomLetter = letters.randomElement()!
            //if letter not in myArray
            if !myArray.contains(randomLetter){
                myArray.append(randomLetter)
            }
        }
        myArray.shuffle()

        return myArray
    }
    
    func calculateNewScore(selectedLetter: String) {

        if selectedLetter == targetLetter{
            score += 1
        }
    }
    
    func updateTargetLetterLabel() {
        titleLetter.text = targetLetter
    }
    
    func updateScoreLabel() {
        theScoreLabel.text = String(score)
    }
    
    func updateLetterButtons() {
        for index in 0..<letterButtons.count{
            let button = letterButtons[index]
            let letter = randomLetters[index]
            
            button.setTitle(letter, for: .normal)
        }
        
    }
}
