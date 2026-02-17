//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/16/26.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    var selectedAnswerIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }

    func loadQuestion() {
        let topic = QuizData.topics[QuizManager.currentTopic]
        let question = topic.questions[QuizManager.currentQuestion]
        questionLabel.text = question.text
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let topic = QuizData.topics[QuizManager.currentTopic]
        return topic.questions[QuizManager.currentQuestion].answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        let answers = QuizData.topics[QuizManager.currentTopic].questions[QuizManager.currentQuestion].answers
        cell.textLabel?.text = answers[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnswerIndex = indexPath.row
    }

    @IBAction func submitTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showAnswer", sender: nil)
    }
}
