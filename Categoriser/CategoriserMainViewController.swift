//
//  CategoriserMainViewController.swift
//  Categoriser
//
//  Created by Martin Zhang on 2017-01-28.
//  Copyright © 2017 Martin Zhang. All rights reserved.
//

import Foundation
import UIKit

class CategoriserMainViewController: UITableViewController {
    
    let segueToQuestionInfoIdentifier = "showQuestionInfoSegue"
    var wrongQuestions: [WrongQuestion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        
        self.tableView.reloadData()
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            wrongQuestions = try context.fetch(WrongQuestion.fetchRequest())
        }
        
        catch {
            print("Error fetching data.")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrongQuestions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        let question = wrongQuestions[indexPath.row]
        cell.textLabel?.text = question.typeName!
        
        return cell
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToQuestionInfoIdentifier {
            let destVC = segue.destination as! QuestionInfoViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedQuestion = wrongQuestions[indexPath.row]
                
                destVC.numberGotWrong = String(selectedQuestion.numberWrong)
                destVC.questionSubjectName = selectedQuestion.typeName!
                destVC.testAppearedOnName = selectedQuestion.testOn!
            }
        }
    }
}
