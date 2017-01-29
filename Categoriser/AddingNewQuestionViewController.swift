//
//  AddingNewQuestionViewController.swift
//  Categoriser
//
//  Created by Martin Zhang on 2017-01-28.
//  Copyright © 2017 Martin Zhang. All rights reserved.
//

import Foundation
import UIKit

class AddingNewQuestionViewController: UIViewController {
    
    // Properties:
    @IBOutlet weak var questionSubjectTypeTextField: UITextField!
    @IBOutlet weak var testQuestionAppearedOnTextField: UITextField!
    
    override func viewDidLoad() {

    }
    
    // Methods:
    @IBAction func cancelNavigationBarButtonClicked(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneNavigationBarButtonClicked(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let question = WrongQuestion(context: context)
        question.typeName = questionSubjectTypeTextField.text
        question.testOn = testQuestionAppearedOnTextField.text
        
        // Save to core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
    }
}
