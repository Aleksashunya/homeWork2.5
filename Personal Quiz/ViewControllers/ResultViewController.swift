//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        let myAnimal = whatAnimal(answers)
        resultLabel.text = "Вы - \(myAnimal!.rawValue)"
        resultDescriptionLabel.text = "\(myAnimal!.definition)"
    }
    
    func whatAnimal(_ answers: [Answer]) -> AnimalType? {
        var numberOfAnswers = [AnimalType: Int]()
        
        for answer in answers {
            numberOfAnswers[answer.type] = 0
            numberOfAnswers[answer.type] = (numberOfAnswers.map { $0.key == answer.type }).count
        }
        // так как при решении используется словарь, то в связи с тем, что словарь это не упорядоченная коллекция, в данном варианте при равном количестве баллов у нескольких животных, выбор будет рандомным
        
        let maxChoses = numberOfAnswers.max { $0.value < $1.value }
        return maxChoses!.key
    }
}


