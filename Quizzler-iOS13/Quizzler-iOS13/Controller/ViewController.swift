//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdbutton: UIButton!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    var quizbrain=quizBrain()
    
   @IBAction func AnswerKeyPressed(_ sender: UIButton) {
        let userAnswer=sender.currentTitle!
        let userGotitRight=quizbrain.checkAnswer(userAnswer)
        
        if userGotitRight  {
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
        quizbrain.nextQuestion()
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            self.updateUI()
        }
        
    }
    func updateUI(){
        progressBar.progress=quizbrain.getProgress()
        QuestionLabel.text=quizbrain.getQuestionText()
        firstButton.setTitle(quizbrain.getChoices1Text(), for: .normal)
        secondButton.setTitle(quizbrain.getChoices2Text(), for: .normal)
        thirdbutton.setTitle(quizbrain.getChoices3Text(), for: .normal)
        scoreLabel.text="Score: \(quizbrain.getScore())"
        firstButton.backgroundColor=UIColor.clear
        secondButton.backgroundColor=UIColor.clear
        thirdbutton.backgroundColor=UIColor.clear
    }
}

