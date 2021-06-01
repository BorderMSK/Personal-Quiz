//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // 1. Массив ответов
    // 2. Определить наиболее часто встречаемый тип животного
    // 3. Отобразить результат
    // 4. Избавиться от кнопки Back - check 
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult()
        
    }
    private func updateResult(){
        var countAnimal: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            countAnimal[animal] = (countAnimal[animal] ?? 0) + 1
        }
        let sortedAnimals = countAnimal.sorted { $0.value > $1.value }
        
        guard let mostAnimals = sortedAnimals.first?.key else { return }
        
        updateUI(with: mostAnimals)
    }
    private func updateUI(with animal: AnimalType){
        resultLabel.text = "Вы - \(animal.rawValue)"
        resultTextLabel.text = "\(animal.definition)"
    }
}
