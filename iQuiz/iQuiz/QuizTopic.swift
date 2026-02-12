//
//  QuizTopic.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/11/26.
//

import UIKit

struct QuizTopic {
    let title: String
    let description: String
    let imageName: String
}

struct QuizData {
    static let topics: [QuizTopic] = [
        QuizTopic(title: "Mathematics", description: "Test your math skills!", imageName: "math"),
        QuizTopic(title: "Marvel Super Heroes", description: "How well do you know Marvel superheros?",imageName: "marvel"),
        QuizTopic(title: "Science",description: "Explore the world with science!",imageName: "science")
    ]
}
