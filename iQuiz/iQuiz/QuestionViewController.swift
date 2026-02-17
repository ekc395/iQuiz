//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/16/26.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var selectedAnswerIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadQuestion()
    }

    func loadQuestion() {
        let topic = QuizData.topics[QuizManager.currentTopic]
        let question = topic.questions[QuizManager.currentQuestion]
        questionLabel.text = question.text
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let topic = QuizData.topics[QuizManager.currentTopic]
        return topic.questions[QuizManager.currentQuestion].answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "AnswerCell")
        let answers =
        QuizData.topics[QuizManager.currentTopic]
            .questions[QuizManager.currentQuestion]
            .answers
        cell.textLabel?.text = answers[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnswerIndex = indexPath.row
    }

    @IBAction func submitTapped(_ sender: UIButton) {
        guard selectedAnswerIndex != nil else {
            return
        }
        performSegue(withIdentifier: "showAnswer", sender: nil)
    }
}
