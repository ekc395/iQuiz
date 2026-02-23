//
//  Question.swift
//  iQuiz
//
//  Created by Ethan Chen on 2/16/26.
//

import UIKit

struct Question: Codable {

    let text: String
    let answers: [String]
    let correctIndex: Int

    enum CodingKeys: String, CodingKey {
        case text
        case answers
        case correctIndex = "answer"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
        answers = try container.decode([String].self, forKey: .answers)
        let answerString = try container.decode(String.self, forKey: .correctIndex)
        correctIndex = Int(answerString)! - 1
    }
}
