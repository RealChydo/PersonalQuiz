//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Геник Мурадян on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    @IBOutlet private var bigResultLabel: UILabel!
    @IBOutlet private var littleResultLabel: UILabel!
    
    var answers: [Answer]!
    
    private var resultAnimal: Animal {
        getResult()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        bigResultLabel.text = "Вы - \(resultAnimal.rawValue)!"
        littleResultLabel.text = resultAnimal.definition

    }
    
    @IBAction private func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getResult() -> Animal {
        let animals = answers.map {$0.animal}
        let result = animals.reduce(into: [:]) { counts, animals in
            counts[animals, default: 0] += 1
        }
        return result.sorted(by: { $0.value < $1.value } ).last!.key
        
        // Чтобы придти к решению выше, я потратил много времени. Но в случае, если оно кажется не читаемым, ниже оставлю своё первое решение.
        
        
//        var resultScore: [Animal : Int] = [:]
//        var result: Animal!
//        for answer in answers {
//            if resultScore[answer.animal] == nil {
//                resultScore[answer.animal] = 1
//            } else {
//                resultScore[answer.animal]! += 1
//            }
//        }
//
//        for key in resultScore.keys {
//            if resultScore[key] == resultScore.values.max() {
//                result = key
//            }
//        }
//
//        return result
    }
}
