//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Rishabh Bhati on 06/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct Questions{
    let text: String
    let choice: [ String]
    let answer: String
    init(q: String, c: [String],  a: String) {
        self.text = q
        self.choice=c
        self.answer = a
    }
}
