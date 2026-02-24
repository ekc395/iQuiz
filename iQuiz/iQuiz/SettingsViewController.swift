//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/23/26.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!

    let defaultURL = "http://tednewardsandbox.site44.com/questions.json"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load saved URL or default
        let savedURL = UserDefaults.standard.string(forKey: "quizURL")
        urlTextField.text = savedURL ?? defaultURL
    }

    @IBAction func checkNowTapped(_ sender: UIButton) {

        guard let urlString = urlTextField.text,
                !urlString.isEmpty else { return }

        UserDefaults.standard.set(urlString, forKey: "quizURL")

        NetworkManager.shared.fetchQuizzes(from: urlString) { success in
            if success {
                self.dismiss(animated: true)
            } else {
                let alert = UIAlertController(
                    title: "Network Error",
                    message: "Unable to download quizzes.",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}
