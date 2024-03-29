//
//  GameBrain.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import Foundation

class GameBrain {
    
    static let shared = GameBrain()
    
    var targetLetter: String = ""
    var randomLetters: [String] = []
    var score = 0
    var highScore = 0
    var numLetters = 0
    var secondsRemaining = 30
    var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    func generateRandomLetters(numLetters: Int) -> [String]{
        // return an array of letters
        //There should be as many letters as `numLetters`.
        //The array should include the target letter.
        //The rest of the letters should be random.
        //A letter should show up in the array only once.
        //The order of the letters should be random.
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
    
    func newRound(){
        //Generate a random letter and assign it to `targetLetter`.
        //Set `randomLetters` to the result of calling `generateRandomLetters`.
        targetLetter = letters.randomElement()!
        
        randomLetters = generateRandomLetters(numLetters: self.numLetters)
        
//        updateTargetLetterLabel()
//        updateLetterButtons()
    }
    
    func newGame(numLetters:Int){
        self.numLetters = numLetters
        //Accept the number of letters for the game and assign `numLetters` accordingly.
        //Set the `score` to 0.
        //Set the `secondsRemaining` to 30.
        //Call `newRound`.
        
        score = 0
        secondsRemaining = 30
        newRound()
        
    }
    
    func letterSelected(selectedLetter: String){
        //Accept the letter the user selected and update the `score` and `highScore` accordingly.
        //Call `newRound`.
        if selectedLetter == targetLetter{
            score += 1
        }
        if score > highScore{
            highScore = score
        }
            
        newRound()

    }
    
}



