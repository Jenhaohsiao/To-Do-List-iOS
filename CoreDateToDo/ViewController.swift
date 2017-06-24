//
//  ViewController.swift
//  CoreDateToDo
//
//  Created by HSIAO JENHAO on 2016-10-30.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [TaskTable] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        getData()
        
        
        //reload the table view
        tableView.reloadData()
        ifNoTask()
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.taskIsImportant{
            cell.textLabel?.text = "👍\(task.taskName!), \(task.taskDescription!)"
 
            
        }else{
            cell.textLabel?.text = "💩\(task.taskName!), \(task.taskDescription!)"
          
        }
        
        
        
        
        return cell
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
        
        tasks = try context.fetch(TaskTable.fetchRequest())
            
        }
        catch {
            print("Fetching Failed")
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
          let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        

        
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            
            do{
                tasks = try context.fetch(TaskTable.fetchRequest())
                
            }
            catch {
                print("Fetching Failed")
            }

        }
        
        tableView.reloadData()
        ifNoTask()
    }
    
    
    func ifNoTask(){
        
        
        if tasks.count == 0 {
            
            let alert = UIAlertController(title:nil,message: "No any Task now",preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style:.destructive , handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion:nil)
            
        }else{
            
        }
        
        
        
    }
   


}

