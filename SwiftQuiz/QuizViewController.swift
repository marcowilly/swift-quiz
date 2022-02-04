//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by marco willy on 29/11/20.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!

    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }, completion: { (success) in
            self.showResults()
        })
        
        getNewQuiz()
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.getQuestion()
        var i = 0
        quizManager.getOptions().forEach{option in
            btAnswers[i].setTitle(option, for: .normal)
            i += 1
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.getTotalAnswers()
        resultViewController.totalCorrectAnswers = quizManager.getTotalCorrectAnswers()
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        quizManager.validateAnswer(index: btAnswers.index(of: sender)!)
        getNewQuiz()
    }
    
}
