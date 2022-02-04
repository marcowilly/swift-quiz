//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by marco willy on 29/11/20.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswed: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbAnswed.text = "Perguntas respondidas: \(totalAnswers)"
        lbCorrect.text = "Perguntas corretas: \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        var score = (totalCorrectAnswers * 100)/(totalAnswers == 0 ? 1 : totalAnswers)
        lbScore.text = "\(score)%"
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
