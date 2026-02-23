//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/16/26.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var selectedAnswerIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        let topic = NetworkManager.shared.topics[QuizManager.currentTopic]
        let question = topic.questions[QuizManager.currentQuestion]

        questionLabel.text = question.text
        answerLabel.text = question.answers[question.correctIndex]

        if let selected = selectedAnswerIndex,
           selected == question.correctIndex {
            resultLabel.text = "Correct!"
            QuizManager.score += 1
        } else {
            resultLabel.text = "Incorrect"
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {

        QuizManager.currentQuestion += 1

        let topic = NetworkManager.shared.topics[QuizManager.currentTopic]

        if QuizManager.currentQuestion < topic.questions.count {
            performSegue(withIdentifier: "nextQuestion", sender: nil)
        } else {
            performSegue(withIdentifier: "showFinished", sender: nil)
        }
    }
}
