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
    let questions: [Question]
}

struct QuizData {
    static let topics: [QuizTopic] = [

        QuizTopic(
            title: "Mathematics",
            description: "Test your math skills!",
            imageName: "math",
            questions: [
                Question(
                    text: "What is 2 + 2?",
                    answers: ["3", "4", "5", "6"],
                    correctIndex: 1
                ),
                Question(
                    text: "What is 5 * 3?",
                    answers: ["15", "10", "8", "20"],
                    correctIndex: 0
                )
            ]
        ),

        QuizTopic(
            title: "Marvel Super Heroes",
            description: "How well do you know Marvel?",
            imageName: "marvel",
            questions: [
                Question(
                    text: "Who is Iron Man?",
                    answers: ["Steve Rogers", "Tony Stark", "Bruce Banner"],
                    correctIndex: 1
                ),
                Question(
                    text: "Who is Spider Man?",
                    answers: ["Andrew Garfield", "Tom Holland", "Tobey Maguire", "All of them"],
                    correctIndex: 3
                )
            ]
        ),

        QuizTopic(
            title: "Science",
            description: "Explore the world with science!",
            imageName: "science",
            questions: [
                Question(
                    text: "What planet is known as the Red Planet?",
                    answers: ["Earth", "Mars", "Venus"],
                    correctIndex: 1
                ),
                Question(
                    text: "What planet is closest to the sun?",
                    answers: ["Mercury", "Uranus", "Saturn"],
                    correctIndex: 0
                )
            ]
        )
    ]
}
