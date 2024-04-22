//
//  ScoresViewController.swift
//  DMFindingGame
//
//  Created by Lesley Lopez on 4/22/24.
//

import UIKit

class ScoresViewController: UIViewController, UITableViewDataSource {
    // create array of score objects to use in my table view
    var scores: [Score] = []
    
    
    // my outlet for the table view
    @IBOutlet weak var tableView: UITableView!
    
    
    // datasource protocal func - # of cells will be equal to amount of scores
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    // datasource protocal func - whats in the cell - the actual score which we access with .score
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)
        let score = scores[indexPath.row]
        cell.textLabel?.text = "Score: \(score.score)"
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ScoreCell")
        tableView.dataSource = self
        scores = CoreDataManager.shared.fetchScores()
        tableView.reloadData()
    }
    
  
    
   

}
