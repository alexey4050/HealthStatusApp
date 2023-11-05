//
//  ViewController.swift
//  HealthStatus
//
//  Created by testing on 01.11.2023.
//

import UIKit

final class HealthSurveyViewController: UIViewController {
    var testData: [TextData] = []
    
    var currentQuestionIndex = 0
    var totalScore = 0
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerSegmentedControl: UISegmentedControl!
    @IBOutlet var nextQuestionButton: UIButton!
    @IBOutlet var newQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestionButton.layer.cornerRadius = 4
        newQuestionButton.layer.cornerRadius = 4
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]
        answerSegmentedControl.setTitleTextAttributes(attributes, for: .normal)
        testData = getQuestion()
        updateQuestion()
    }
    
    private func updateQuestion() {
        guard currentQuestionIndex < testData.count else {
            nextQuestionButton.isHidden = true
            return
        }
        
        let currentQuestion = testData[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        answerSegmentedControl.removeAllSegments()
        
        let currentOptions = currentQuestion.options
        
        for (index, option) in currentOptions.enumerated() {
            answerSegmentedControl.insertSegment(withTitle: option, at: index, animated: false)
        }
        answerSegmentedControl.sizeToFit()
    }
    
    @IBAction func nextQuestionButtonTapped(_ sender: UIButton) {
        
        let currentQuestion = testData[currentQuestionIndex]
        let selectedOption = answerSegmentedControl.selectedSegmentIndex
        let options = currentQuestion.options
        
        if selectedOption >= 0 && selectedOption < options.count {
            let selectedOptionText = options[selectedOption]
            
            let score = calculateScore(selectedOptionText)
            
            totalScore += score
            currentQuestionIndex += 1
            
            if currentQuestionIndex >= testData.count {
                performSegue(withIdentifier: "show", sender: nil)
                currentQuestionIndex = 0
                totalScore = 0
            } else {
                updateQuestion()
            }
        }
    }
    
    private func calculateScore(_ option: String) -> Int {
        var score = 0
        
        switch option {
        case "Супер", "Всегда", "9 - 10 часов":
            score += 5
        case "Отличное", "Every day", "7 - 9 часов":
            score += 4
        case "Хорошее", "Two of week", "5 - 7 часов":
            score += 3
        case "Так себе", "Two of month", "менее 5 часов":
            score += 2
        case "Плохое", "Никогда":
            score += 1
        default:
            break
        }
        
        return score
    }
    
    @IBAction func restartSurveyButton(_ sender: UIButton) {
        currentQuestionIndex = 0
        totalScore = 0
        updateQuestion()
        nextQuestionButton.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.totalScore = totalScore
        }
    }
}
