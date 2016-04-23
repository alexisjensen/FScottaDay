//
//  MenuViewController.swift
//  Vonnegut a Day
//
//  Created by Alexis Jensen on 2015-10-14.
//  Copyright © 2015 beep. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    //MARK: - Outlets and Properties
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet weak var reminderIsLabel: UILabel!
    @IBOutlet weak var reminderSwitchOutlet: UISwitch!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
  
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var setOutlet: UIButton!
    @IBOutlet weak var checkMark: UIImageView!
  
    
    //MARK: - Load ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    
    
    
    //MARK: - Setup and its helper functions
    func setup() {
        
        rememberSwitchState()
        
        rememberReminderTime()
        
        checkMark.alpha = 0
        timePicker.alpha = 0
        setOutlet.alpha = 0
        
        //removes the selectors (ie the lines between the numbers) in picker
        timePicker.subviews[0].subviews[1].hidden = true
        timePicker.subviews[0].subviews[2].hidden = true
    }
    
    
    
    func rememberSwitchState() {
        
        reminderSwitchOutlet.on =  NSUserDefaults.standardUserDefaults().boolForKey("switchState")
        
    }
    
    
    
    func rememberReminderTime(){
        
        if reminderSwitchOutlet.on {
            
            let storedTime = NSUserDefaults.standardUserDefaults().objectForKey("timePicker") as! String
            
            timeLabel.text = "Set to \(storedTime)"
            bellImage.alpha = 1
            
        } else {
            
            timeLabel.alpha = 0
            bellImage.alpha = 0
        }
    }
    
    
    
    
    
    
    // MARK: - Action: Reminder Switch and its helper functions
    @IBAction func reminderSwitch(sender: AnyObject) {
        
        if reminderSwitchOutlet.on {
            
            // Turn on Visuals
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                self.on()
                
            })
            
        }  else {
            
            cancelNotification()
            
            saveSwitchState()
            
            //Turn off Picker and Set Button
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                self.off()
            })
        }
    }
    
    
    
    func on(){
        
        self.timePicker.alpha = 1
        self.setOutlet.alpha = 1
        self.menuView.frame.size.height = 280
    }
    
    
    
    func off() {
        
        self.timePicker.alpha = 0
        self.setOutlet.alpha = 0
        self.timeLabel.alpha = 0
        self.bellImage.alpha = 0
        self.menuView.frame.size.height = 200
        
    }
    
    
    func cancelNotification() {
        
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        
    }
    
    
    
    
    //MARK: - Action: Set Button and its helper functions
    @IBAction func setButton(sender: AnyObject) {
        
        let chosenTime = timePicker.date
        
        //Making the first remonder go off tomorrow, since we can assume
        // they already looked at it today.
        let notificationTime = tomorrowsNotifcationTime(chosenTime)
        
        setUpNotification(notificationTime)
        
        setButtonVisualsAndSegue()
        
        //to be retrieved for later use when checking notification time.
        saveNotificationTime(notificationTime)
        
        saveSwitchState()
        
        saveTimePickerTimeToDisplayToUser()
        
    }
    
    
    
    /** If notification time is set for later that day and user has already
     viewed the quote, it ignores today and notifies them tomorrow. */
    func tomorrowsNotifcationTime(notificationTime: NSDate) -> NSDate {
        
        let dayInSeconds:Double = 86399
        
        let tomorrowsNotificationTime = notificationTime.dateByAddingTimeInterval(+dayInSeconds)
        
        return tomorrowsNotificationTime
    }
    
    
    
    /** Sets up the custom Vonnegut a Day UILocalNotification, and repeats
     the notificatioon every 24 hours. */
    func  setUpNotification(notificationTime: NSDate) {
        
        let notification = UILocalNotification()
        notification.alertBody = "Hello, friendly quote reminder."
        notification.fireDate = notificationTime
        notification.repeatInterval = NSCalendarUnit.Day
        // By setting the timezone, the notification will adjust
        // to where ever the user is.
        notification.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    
    
    /** Turns all the setting functionality off and displays a checkmark.
     Then segues back to Quote VC. */
    func setButtonVisualsAndSegue() {
        
        // Turns everything off
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.everythingOff()
        }
        
        
        // Sets menuView back to original height
        UIView.animateWithDuration(0.6) { () -> Void in
            
            self.menuView.frame.size.height = 200
        }
        
        // Turns checkmark on
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.checkMark.alpha = 0.6
            
            
            }, completion: { finished in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                NSNotificationCenter.defaultCenter().postNotificationName("closeMenuViewController", object: nil)
        })
    }
    
    
    
    
    func saveNotificationTime(chosenTime: NSDate) {
        
        NSUserDefaults.standardUserDefaults().setObject(chosenTime, forKey: "notificationTime")
        
    }
    
    
    func saveSwitchState() {
        
        NSUserDefaults.standardUserDefaults().setBool(reminderSwitchOutlet.on, forKey: "switchState")
        
    }
    
    
    /** Formats chosen time to display hh:mm and saves it. */
    func saveTimePickerTimeToDisplayToUser() {
        
        // Get and format time
        let timeFromTimepicker = timePicker.date
        let theTimeFormat = NSDateFormatterStyle.ShortStyle
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = theTimeFormat
        let storeTime = dateFormatter.stringFromDate(timeFromTimepicker)
        
        //Store time to display in timeLabel
        NSUserDefaults.standardUserDefaults().setObject(storeTime, forKey: "timePicker")
    }
    
    
    
    func everythingOff(){
        
        self.reminderSwitchOutlet.alpha = 0
        self.reminderIsLabel.alpha = 0
        self.timePicker.alpha = 0
        self.setOutlet.alpha = 0
        self.timeLabel.alpha = 0
        self.bellImage.alpha = 0
        self.line.alpha = 0
        
    }
    
}
