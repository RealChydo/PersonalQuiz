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
    
    /* Это решение составлял очень долго и остался вопрос,
     касательно корректного сноса строки. Я предположил снос по методам.
     По сути получилась одна строка, приватный метод решил убрать.
     */
    private var resultAnimal: Animal {
        answers
            .map({$0.animal})
            .reduce(into: [:]) {counts, animals in counts[animals, default: 0] += 1}
            .sorted(by: { $0.value < $1.value })
            .last! // Форс анврап допустим, без результата на экран не попасть
            .key
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
}
