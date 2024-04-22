//
//  CoreDataManager.swift
//  DMFindingGame
//
//  Created by Lesley Lopez on 4/18/24.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    /**
     Add the passed score to CoreData.
     */
    func addScore(score: Int) {
        let context = persistentContainer.viewContext
        
        let newScore = Score(context: context)
        newScore.score = Int16(score)
        do {
            try context.save()
            print("Score saved: \(score)")
        } catch {
            print("There was in error in addScore Function!")
        }
        
    }
    
    /**
     Retrieve all the scores from CoreData.
     */
    func fetchScores() -> [Score] {
        let context = persistentContainer.viewContext
        
        // this line creates a fetch request for all objects of Score type
        let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest()
        
        do {
            // this line performs the actual retrieval of data
            let scores = try context.fetch(fetchRequest)
            // if successful - returns an array of Score objects
            return scores
        } catch {
            print("There was an error in your fetchScores Function")
            return []
        }
    }
    
    /**
     Calculate the high score.
     */
    func calculateHighScore() -> Int {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest()
        
        // can use sort on the request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "score", ascending: false)]
        fetchRequest.fetchLimit = 1
        
        do {
            let results = try context.fetch(fetchRequest)
            // return the value of 1st result because i guess it still comes back as an array?
            
            if let highestScore = results.first {
                return Int(highestScore.score)
            } else {
                return 0
            }
            
            } catch {
            print("There was an issue in your calculateHighScore function!")
            return 0
        }
       
    }
}

