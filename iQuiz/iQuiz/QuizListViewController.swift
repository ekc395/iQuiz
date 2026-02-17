//
//  QuizListViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/11/26.
//

import UIKit

class QuizListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")

        tableView.delegate = self
        tableView.dataSource = self
        title = "iQuiz"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizData.topics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "QuizCell")

        let topic = QuizData.topics[indexPath.row]

        cell.textLabel?.text = topic.title
        cell.detailTextLabel?.text = topic.description
        cell.imageView?.image = UIImage(named: topic.imageName)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    @IBAction func settingsTapped(_ sender: UIBarButtonItem) {

        let alert = UIAlertController(
            title: "Settings",
            message: "Settings go here",
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuestion",
           let indexPath = tableView.indexPathForSelectedRow {
            QuizManager.currentTopic = indexPath.row
            QuizManager.currentQuestion = 0
            QuizManager.score = 0
        }
    }
}
