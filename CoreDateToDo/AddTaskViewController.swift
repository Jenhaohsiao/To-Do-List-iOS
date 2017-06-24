//
//  AddTaskViewController.swift
//  CoreDateToDo
//
//  Created by HSIAO JENHAO on 2016-10-30.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    @IBOutlet weak var taskDescriptionTextFiel: UITextField!
    

    @IBOutlet weak var isImp: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func butSave(_ sender: Any) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = TaskTable(context: context)
        
        task.taskName = taskNameTextField.text!
        task.taskDescription = taskDescriptionTextFiel.text!
        
        task.taskIsImportant = isImp.isOn
        
        
        //Save the data to core date
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
  

}
 
