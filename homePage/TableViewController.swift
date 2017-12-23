//
//  TableViewController.swift
//  homePage
//
//  Created by Maitri Chattopadhyay on 9/28/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit



class TableViewController: UITableViewController {
    
    @IBOutlet weak var taskDesc: UILabel!
    @IBOutlet weak var taskDate: UILabel!
    @IBOutlet weak var taskName: UILabel!
    
   let user = ModelFile() // object of the file
    var arrayOfObjects = [ModelFile]() // array to store objects of the file
       
  @IBAction
    func unwindSegueToSecondPage(_ segToSec: UIStoryboardSegue)
    
    {
        // creating new instance of the class for each new row
        let user = ModelFile (title: Goal, description: GoalDescription, startDate: Date, repeatWeekly: repeatD, repeatForever: repeatF)
        
        if !(user.title?.isEmpty)!
        {
            arrayOfObjects.append(user)
            tableView.reloadData()
        }
        print(arrayOfObjects)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfObjects.count
    }
    
    
    // fucntion to fill in the contect of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let  currentObject = arrayOfObjects[indexPath.row]
        cell.textLabel?.text = currentObject.title
        cell.detailTextLabel?.text = currentObject.description
        return cell
    }
    
    // function to delete a row by sliding
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            arrayOfObjects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

