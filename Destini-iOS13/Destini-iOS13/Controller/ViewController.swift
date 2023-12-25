//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
//    let story0="You see a Fork in the road"
//    let choice1="Take a Left"
//    let choice2="Take a Right"
    override func viewDidLoad() {
        super.viewDidLoad()
//        storyLabel.text = story0
//
//        choice1Button.setTitle(choice1, for: .normal)
//        choice2Button.setTitle(choice2, for: .normal)
        updateUI()
        

    }
    var storyBrain=StoryBrain()
    @IBAction func choiceMade(_ sender: UIButton) {
        let choiceSelection=sender.currentTitle!
        storyBrain.checkDestination(choiceSelection)
        updateUI()
    }
    func updateUI(){
        storyLabel.text = storyBrain.getQuestionText()
        choice1Button.setTitle(storyBrain.getChoice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2Text(), for: .normal)
        
    }
    
  
    
    


}

