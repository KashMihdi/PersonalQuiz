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
        navigationItem.hidesBackButton = true
        getResult(for: answerChosen)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    private func getResult(for answers: [Answer]) {
        let animals = answers.map{ $0.animal }
        let animal = Dictionary(grouping: animals, by: { $0 })
            .sorted(by: { $0.value.count > $1.value.count })
            .first?
            .key
        
        guard let animal else { return }
        titleLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
