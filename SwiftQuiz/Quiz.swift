//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by marco willy on 29/11/20.
//

import Foundation

class Quiz {
    
    private let question: String
    private let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateOptions(_ index: Int) -> Bool{
        let answer = options[index]
        return answer == correctedAnswer
    }
    
    func getQuestion() -> String {
       return question
    }
    
    func getOptions() -> [String] {
        return options
    }
    
    deinit {
        print("liberou quiz da memória")
    }
}
