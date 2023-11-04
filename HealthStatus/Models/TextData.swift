//
//  Autors.swift
//  HealthStatus
//
//  Created by testing on 01.11.2023.
//

import Foundation

struct TextData {
    let question: String
    let options: [String]
    let result: String
    let name = "Alexey"
    let surname = "Kiselev"
}

func getQuestion() -> [TextData] {
    var questions = [TextData]()
    
    let questionList = HealthQuestion.questions
    let optionList = HealthQuestion.options
    let resultList = HealthQuestion.result

    for index in 0..<questionList.count{
        let question = TextData(question: questionList[index], options: optionList[index], result: resultList[index])
        questions.append(question)
    }
    return questions
}

//enum AnswerOption: Int {
//    case excellent, inEveryMeal, nineToNetHour, neverMissTraining
//    case veryGood, everyDay, sevenToNineHour
//    case good, severalTimesAWeek, fiveToSevenHour
//    case satisfactory, onceAWeek, lessThsnHour
//    case poor, never
//}

