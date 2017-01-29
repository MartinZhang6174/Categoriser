//
//  QuestionInfoViewController.swift
//  Categoriser
//
//  Created by Martin Zhang on 2017-01-28.
//  Copyright © 2017 Martin Zhang. All rights reserved.
//

import Foundation
import UIKit

class QuestionInfoViewController: UIViewController {
    
    // Properties:
    var questionSubjectName: String = ""
    var testAppearedOnName: String = ""
    var numberGotWrong: String = ""
    
    @IBOutlet weak var questionSubjectTypeLabel: UILabel!
    @IBOutlet weak var testAppearedOnLabel: UILabel!
    @IBOutlet weak var numberWrongLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionSubjectTypeLabel.text = questionSubjectName
        testAppearedOnLabel.text = testAppearedOnName
        numberWrongLabel.text = String(numberGotWrong)
    }
    
    
}
