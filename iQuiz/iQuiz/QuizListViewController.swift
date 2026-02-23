//
//  QuizListViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/11/26.
//

import UIKit

class QuizListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!

    let defaultURL = "http://tednewardsandbox.site44.com/questions.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "iQuiz"
        loadQuizzes()
    }

    func loadQuizzes() {
        NetworkManager.shared.fetchQuizzes(from: defaultURL) { success in
            if success {
                self.tableView.reloadData()
            } else {
                self.showNetworkError()
            }
        }
    }

    func showNetworkError() {
        let alert = UIAlertController(
            title: "Network Error",
            message: "Unable to download quizzes.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.shared.topics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "QuizCell")
        let topic = NetworkManager.shared.topics[indexPath.row]
        cell.textLabel?.text = topic.title
        cell.detailTextLabel?.text = topic.description
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestion", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuestion",
           let indexPath = tableView.indexPathForSelectedRow {
            QuizManager.currentTopic = indexPath.row
            QuizManager.currentQuestion = 0
            QuizManager.score = 0
        }
    }

    @IBAction func settingsTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "Settings",
            message: "Settings will go here",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
