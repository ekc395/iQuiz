//
//  NetworkManager.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/23/26.
//

import UIKit

class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    var topics: [QuizTopic] = []

    func fetchQuizzes(from urlString: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(false)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error:", error)
                DispatchQueue.main.async { completion(false) }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async { completion(false) }
                return
            }
            do {
                let decoded = try JSONDecoder().decode([QuizTopic].self, from: data)
                self.topics = decoded
                DispatchQueue.main.async {
                    completion(true)
                }
            } catch {
                print("Decoding error:", error)
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }.resume()
    }
}
