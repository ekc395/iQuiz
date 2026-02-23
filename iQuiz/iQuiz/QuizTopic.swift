//
//  QuizTopic.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/11/26.
//

import UIKit

struct QuizTopic: Codable {

    let title: String
    let description: String
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case title
        case description = "desc"
        case questions
    }
}
