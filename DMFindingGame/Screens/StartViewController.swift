//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    let gameBrain = GameBrain.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        highScoreLabel.text = "HighScore: \(String(CoreDataManager.shared.calculateHighScore()))"
        
    }
    
    
}


