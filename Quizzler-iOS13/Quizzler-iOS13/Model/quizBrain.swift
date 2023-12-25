//
//  quizBrain.swift
//  Quizzler-iOS13
//
//  Created by Rishabh Bhati on 19/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct quizBrain{
    let questions=[
        Questions(q: "Which is the largest organ in the human body?", c: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
                Questions(q: "Five dollars is worth how many nickels?", c: ["25", "50", "100"], a: "100"),
                Questions(q: "What do the letters in the GMT time zone stand for?", c: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
                Questions(q: "What is the French word for 'hat'?", c: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
                Questions(q: "In past times, what would a gentleman keep in his fob pocket?", c: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
                Questions(q: "How would one say goodbye in Spanish?", c: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
                Questions(q: "Which of these colours is NOT featured in the logo for Google?", c: ["Green", "Orange", "Blue"], a: "Orange"),
                Questions(q: "What alcoholic drink is made from molasses?", c: ["Rum", "Whisky", "Gin"], a: "Rum"),
                Questions(q: "What type of animal was Harambe?", c: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
                Questions(q: "Where is Tasmania located?", c: ["Indonesia", "Australia", "Scotland"], a: "Australia")

    ]
    var questionNumber=0
    var flag=false
    mutating func checkAnswer(_ useranswer:String)->Bool{
        if(useranswer==questions[questionNumber].answer){
            flag=true
            return true
        }
        else{
            flag=false
            return false
        }
    }
    func getQuestionText()->String{
        return questions[questionNumber].text
    }
    func getChoices1Text()->String{
        return questions[questionNumber].choice[0]
    }
    func getChoices2Text()->String{
        return questions[questionNumber].choice[1]
    }
    func getChoices3Text()->String{
        return questions[questionNumber].choice[2]
    }
    func getProgress()->Float{
        return Float(questionNumber+1) / Float(questions.count)
    }
    mutating func nextQuestion(){
        if questionNumber+1 < questions.count{
            questionNumber+=1
            
        }else{
            questionNumber=0
            score=0
        }
        
    }
    var score=0
    mutating func getScore()->Int{
        if flag{
            score+=1
        }
        return score
    }
}
