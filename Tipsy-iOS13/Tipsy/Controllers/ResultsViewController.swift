//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rishabh Bhati on 28/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var totalbill:String?
    var setting:String?
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLbel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=totalbill
        settingLbel.text=setting
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
