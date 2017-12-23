//
//  ViewController.swift
//  homePage
//
//  Created by Maitri Chattopadhyay on 9/28/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

// global varialble for storing the values entered in the fields
var Goal  = ""
var GoalDescription = ""
var Date = ""
var repeatD = ""
var repeatF = ""


class ViewController: UIViewController, UITextFieldDelegate{
   
    
    
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var newGoalLabel: UITextField!
    @IBOutlet weak var newGoalDescription: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var repeatDaily: UIButton!
    @IBOutlet weak var repeatForever: UIButton!
    @IBOutlet weak var repeatLable: UILabel!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var done: UIButton!
    
    
    
    // function to make the keyboard dismiss when the user clicks anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
     // function to display the picker if its date textfield
   func textFieldDidBeginEditing(_ textField: UITextField)
    {
       
        if textField == date
        {
            textField.resignFirstResponder() // making the keyboard resign.
            picker.isHidden = false
            done.isHidden = false
            save.isEnabled = false  // disabling save till a date is picked
            cancel.isEnabled = false  // disabling cancel till a date is picked
        }
    }
   
    // function to take actoion when the user is done with the date picker
    @IBAction func doneAction(_ sender: UIButton)
    {
        picker.isHidden = true
        done.isHidden = true
        save.isEnabled = true
        cancel.isEnabled = true
        
        // formating the date and time display in the text field
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.medium
        date.text = dateFormatter.string(from: picker.date) // setting the values

        
    }

    // Segue fucntion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        if (segue.identifier == "saveAndGoBack")
            {
                
                if newGoalLabel.text!.isEmpty == false
                {
                    Goal = newGoalLabel.text!
                }
                else
                {
                    Goal = ""
                }
                
                if newGoalDescription.text!.isEmpty == false
                {
                   GoalDescription = newGoalDescription.text!
                }
                else
                {
                    GoalDescription = ""
                }
                
                if date.text!.isEmpty == false
                {
                    Date = date.text!
                }
                else
                {
                    Date = ""
                }
                
                repeatD = repeatDaily.currentTitle!
                repeatF = repeatForever.currentTitle!
            }
        
        if (segue.identifier == "cancelAndGoBack")
            {
                Goal = ""
                GoalDescription = ""
                Date = ""
                repeatD = ""
                repeatF = ""
            }
    }
    
    
    
    // function to make for the keyboard going away when clicked Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    // action sheet
    @IBAction func dailyButton(_ sender: UIButton) {
        
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        // Creating fields for the action sheet
        //Daily
        let daily = UIAlertAction(title: "Daily", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("Daily", for:.normal)})
        alert.addAction(daily)
        
        // Weekly
        let onceWeek = UIAlertAction(title: "Once a week", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("Once a week", for:.normal)})
        alert.addAction(onceWeek)
        
        // monthly
        let onceMonth = UIAlertAction(title: "Once a month", style: UIAlertActionStyle.default, handler: { action in sender.setTitle("Once a month", for:.normal)})
        alert.addAction(onceMonth)
        
        // yearly
        let onceYear = UIAlertAction(title: "Once a year", style: .default, handler: { action in sender.setTitle("Once a year", for:.normal)})
        alert.addAction(onceYear)
        
        present (alert, animated: true, completion:  nil)

    }
    
    
    // action sheet
    @IBAction func foreverButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
         // Creating fields for the action sheet
        //forever
        let forever = UIAlertAction(title: "forever", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("for the rest of my life", for:.normal)})
        alert.addAction(forever)
        
       // for a month
        let forAMonth = UIAlertAction(title: "for a month", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("for one month", for:.normal)})
        alert.addAction(forAMonth)
        
        // for a year
        let forAYear = UIAlertAction(title: "for a year", style: .default, handler: { action in sender.setTitle("for one year", for:.normal)})
        alert.addAction(forAYear)
        
        present (alert, animated: true, completion:  nil)
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad()
    {
        newGoalLabel.delegate = self
        newGoalDescription.delegate = self
        date.delegate = self
        
        picker.isHidden = true
        done.isHidden = true
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}


