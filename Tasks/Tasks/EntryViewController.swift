//
//  EntryViewController.swift
//  Tasks
//
//  Created by Maxim on 12/16/20.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    //user can enter in a task and a done button func and once click it, it will saved
    @IBOutlet var field: UITextField!
//    @IBOutlet var titleField: UITextField!
//    @IBOutlet var datePicker: UIDatePicker!
//
//    public var completion: ((String, String, Date) -> Void)
//
//
//
//
    
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }

    @objc func saveTask(){
        //check empty
        guard let text = field.text, !text.isEmpty
             // ,let titleText = titleField.text, !text.isEmpty
        else {
            return
        }
        
        
        //count how many task we have so far and goona save each task with given numb
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(text, forKey: "task_\(newCount)")

        //update tableview after hit save button (pass in a reference of a func to this view controller), optional, if update fuc exist, call it
        update?()
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
