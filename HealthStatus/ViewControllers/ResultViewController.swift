//
//  ResultViewController.swift
//  HealthStatus
//
//  Created by testing on 02.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    var result: HealthQuestion!
    var totalScore = 0
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var totalScoreLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "ВАШ РЕЗУЛЬТАТ!"
        titleLabel.textColor = UIColor.red
        totalScoreLabel.text = "\(totalScore)"
        getResult()
    }
    
    private func getResult() {
        if totalScore >= 16 {
            commentsLabel.text = HealthQuestion.result[0]
        } else if totalScore >= 11 && totalScore <= 15 {
            commentsLabel.text = HealthQuestion.result[1]
        } else if totalScore >= 6 && totalScore <= 10 {
            commentsLabel.text = HealthQuestion.result[2]
        } else if totalScore <= 5 {
            commentsLabel.text = HealthQuestion.result[3]
        }
    }
}
