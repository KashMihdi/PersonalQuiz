//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answerChosen: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResult(for: answerChosen)
    }
    
    private func getResult(for answers: [Answer]) {
        var animalType = answers[0].animal
        let animals = answers.map{ $0.animal }
        var selectedAnimals: [Animal : Int] = [:]
        
        for animal in animals {
            selectedAnimals[animal] = (selectedAnimals[animal] ?? 0) + 1
            if selectedAnimals[animal] == selectedAnimals.values.max() {
                animalType = animal
            }
        }
        
        titleLabel.text = "Вы - \(animalType.rawValue)"
        descriptionLabel.text = animalType.definition
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
