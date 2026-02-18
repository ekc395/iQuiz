//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/16/26.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let topic = QuizData.topics[QuizManager.currentTopic]
        let total = topic.questions.count
        let score = QuizManager.score

        scoreLabel.text = "\(score) of \(total) correct"

        if score == total {
            messageLabel.text = "Perfect!"
        } else if score >= total/2 {
            messageLabel.text = "Almost!"
        } else {
            messageLabel.text = "Better luck next time!"
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        navigationController?
            .popToRootViewController(animated: true)
    }
}
