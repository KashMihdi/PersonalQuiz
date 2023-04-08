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
        var character = answers[0].animal
        let animals = answers.map{ $0.animal }
        var dict: [Animal : Int] = [:]
        
        for animal in animals {
            dict[animal] = (dict[animal] ?? 0) + 1
            if dict[animal] == dict.values.max() {
                character = animal
            }
        }
        
        titleLabel.text = "Вы - \(character.rawValue)"
        descriptionLabel.text = character.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
