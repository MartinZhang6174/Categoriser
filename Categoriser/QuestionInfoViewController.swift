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
    
    @IBAction func addButtonClicked(_ sender: Any) {
        if var labelValue = Int64(numberWrongLabel.text!) {
            labelValue += 1
            numberWrongLabel.text = String(labelValue)
        }
    }
    
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
        
        var questions = [WrongQuestion]()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            questions = try context.fetch(WrongQuestion.fetchRequest())
        }
            
        catch {
            print("Error saving or fetching data.")
        }
        
//        if let q = questions.filter(<#T##isIncluded: (WrongQuestion) throws -> Bool##(WrongQuestion) throws -> Bool#>)
        if let datQuestion = questions.filter({$0.typeName == questionSubjectTypeLabel.text}).first {
            datQuestion.numberWrong = Int64(numberWrongLabel.text!)!
        } else {

        }
        
        dismiss(animated: true, completion: nil)
    }
}
