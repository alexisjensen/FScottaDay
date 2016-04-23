//
//  QuoteViewController.swift
//  Vonnegut a Day
//
//  Created by Alexis Jensen on 2015-10-10.
//  Copyright © 2015 beep. All rights reserved.
//

import UIKit

@IBDesignable
class QuoteViewController: UIViewController {
    
    //MARK: - Outlets
    ///In z-order like they appear on the storyboard
    @IBOutlet weak var assholeView: AssholeView!
    
    @IBOutlet weak var faceOutlet: UIImageView!
    
    @IBOutlet weak var work: UILabel!
    @IBOutlet weak var quote: UILabel!
    
    @IBOutlet weak var settingsOutlet: UIButton!
    @IBOutlet weak var shareButtonOutlet: UIButton!
    
    @IBOutlet weak var inPartnerLabel: UILabel!
    @IBOutlet weak var linkToKVMLOutlet: UIButton!
    @IBOutlet weak var trademarkLabel: UILabel!
    
    @IBOutlet weak var tapButtonOutlet: UIButton!
    
    
    
    //MARK: - Properties
    var quotes:[Quote] = quotesData as [Quote]
    var quoteIndex = -1
    var isTapped = false
    var tapCounter = 0
    var WORK_TITLE = "Vonnegut a Day"
    
    
    
    //MARK: - Load QuoteViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listenToCallSetup()
        
    }
    
    
    /* Listens in the appdelegate in applicationDidBecomeActive() and when
    the set button is pressed in the MenuViewController.  They both call setup(). */
    func listenToCallSetup(){
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setup:", name:"refreshApp", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setup:", name:"closeMenuViewController", object: nil)

    }
    
    
    
    //MARK: - Setup and its helper functions
    @objc func setup(notification: NSNotification) {
        print("Quotes: \(quotes.count)")
        
        //Function Properties
        let lastDate = NSUserDefaults.standardUserDefaults().objectForKey("dateTracker") as? NSDate
        let nowDate = NSDate()
        
        
        // Only called at first launch
        if lastDate == nil {
            
            unlock()
            
            storeDateWhenAppFirstLaunched()
            
            return
        }
        
        
        
        
        // Called everytime app opens except at first launch
        if lastDate != nil {
            
            /// Properties
            isTapped = NSUserDefaults.standardUserDefaults().boolForKey("tapTracker")
            let dayDifference = checkDayDifference(lastDate, nowDate: nowDate)
            
            
            
            ///Case 1
            if isTapped == false && dayDifference < 1 {
                
                work.text = quotes[getCurrentQuoteIndex()].work
                quote.text = quotes[getCurrentQuoteIndex()].phrase
                unlock()
                return
            }
            
            
            
            
            
            ///Case 2
            if isTapped == true && dayDifference < 1 {
                
                secondTapAKALock()
                breathe()
                tapCounter = 2
                return
                
                
                
                ///Case 3: New day
            } else {
                
                getQuoteIndex()
                
                updateQuote()
                
                setTapBool(false)
                
                unlock()
                
                saveCurrentDateAsOldDate(lastDate!, nowDate: nowDate)
            }
            
        }
        
    }
    
    
    
    /** Visually unlocks the app at the beginning of each day when quote is updated. */
    func unlock() {
        
        work.text = WORK_TITLE
        interiorViewsAlphasAre(0)
        tapCounter = 0
        
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.faceOutlet.alpha = 1
            self.work.alpha = 1
            self.assholeView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }
    }
    
    

    func storeDateWhenAppFirstLaunched() {
        
        let daysInSeconds:Double = 86399
        
        //Sets it to beginning of day
        let firstDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate()) as NSDate
        
        //FUDGE: make this minus a day
        let firstDateMinusADay = firstDate.dateByAddingTimeInterval(-daysInSeconds)
        
        //Stores lastDate property
        NSUserDefaults.standardUserDefaults().setObject(firstDateMinusADay, forKey:"dateTracker")
        
    }
    

    
    
    /** Checks to see the time between now and when app last refreshed
    with a new quote. */
    func checkDayDifference(lastDate: NSDate?, nowDate: NSDate) -> Int {
        
        let userCalendar = NSCalendar.currentCalendar()
        let dayCalendarUnit: NSCalendarUnit = [.Day]
        
        let dayDifference = userCalendar.components(
            dayCalendarUnit,
            fromDate: lastDate!,
            toDate: nowDate,
            options: [])
        
        return dayDifference.day
    }
    
    
    
    
    
    /** Creates a pulse like animation with the assholeview.*/
    func breathe(){
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.assholeView.transform = CGAffineTransformMakeScale(2.3, 2.3)
        }
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 3, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseIn, animations: ({
            self.assholeView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        }), completion: nil)
    }
    

    
    func getQuoteIndex() {
        
        quoteIndex = NSUserDefaults.standardUserDefaults().integerForKey("quoteTracker")
    }
    
   
    
    /** Updates a quote and if quote reaches the end of the list,
     loops back to first quote. */
    func updateQuote() {
        if quoteIndex == quotes.count {
            
            quoteIndex = -1
            work.text = "Cold Turkey"
            quote.text = "I am of course notoriously hooked on cigarettes. I keep hoping the things will kill me. A fire at one end and a fool at the other."
            
        } else {
            
            work.text = quotes[quoteIndex].work
            quote.text = quotes[quoteIndex].phrase
            
        }
        
        quoteIndex++
        NSUserDefaults.standardUserDefaults().setInteger(quoteIndex, forKey: "quoteTracker")
    }
    
    
    
    /** Sets the isTapped boolean and stores it in NSUserDefaults. */
    func setTapBool(flag: Bool) {
        
        isTapped = flag
        NSUserDefaults.standardUserDefaults().setBool(isTapped, forKey: "tapTracker")
    }
    
    
    /** When app is refreshed saves current date as old date to be compared against,
     when quote is next opened. */
    func saveCurrentDateAsOldDate(var lastDate: NSDate, nowDate: NSDate) {
        
        lastDate = nowDate
        let newDate = NSCalendar.currentCalendar().startOfDayForDate(lastDate) as NSDate
        NSUserDefaults.standardUserDefaults().setObject(newDate, forKey:"dateTracker")
    }
    
    

    
    //MARK: - Action: Tap Action and its helper functions
    @IBAction func tapAction(sender: AnyObject) {
        
        
        if tapCounter == 0 {
            
            firstTap()
            setTapBool(true)
            doNotShowReminderTodayIfAppOpenedBeforeScheduledReminder()
            
        }
            
        else if tapCounter == 1 {
            
            breathe()
            secondTapAKALock()
            
            
        }
            
        else if tapCounter == 2 {
            
            thirdTap()
            
            // Set tap to 0 so it will be 1,
            // which makes it ping back and forth
            // between 1 and 2
            tapCounter = 0
            
        }
        
        tapCounter++
    }
    
    
    
    func firstTap() {
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.work.alpha = 0
            self.faceOutlet.alpha = 0
        }
        
        
        // Make background white
        UIView.animateWithDuration(0.7) { () -> Void in
            self.assholeView.transform = CGAffineTransformMakeScale(65.0, 65.0)
            
        }
        
        // Turn quote on
        UIView.animateWithDuration(1.0) { () -> Void in
            
            self.interiorViewsAlphasAre(1)
            
        }
    }
    
    
 
    func secondTapAKALock() {
        interiorViewsAlphasAre(0)
        
        work.text = quotes[getCurrentQuoteIndex()].work
        
        UIView.animateWithDuration(0.5) { () -> Void in
            
            self.assholeView.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.work.alpha = 1
            self.faceOutlet.alpha = 1
            
        }
    }

    
    
    
    func thirdTap() {
        
        quote.text = quotes[getCurrentQuoteIndex()].phrase
        
        // Turn 'Vonnegut a Day' off
        UIView.animateWithDuration(0.1) { () -> Void in
            self.work.alpha = 0
            
        }
        
        
        // Make background white
        UIView.animateWithDuration(0.7) { () -> Void in
            self.assholeView.transform = CGAffineTransformMakeScale(65.0, 65.0)
            
        }
        
        // Turn quote on
        UIView.animateWithDuration(1.0) { () -> Void in
            
            self.interiorViewsAlphasAre(1)
            
        }
    }
    
    
   
    func getCurrentQuoteIndex() -> Int {
        
        quoteIndex = NSUserDefaults.standardUserDefaults().integerForKey("quoteTracker")
        
        var currentQuoteIndex = quoteIndex - 1
        
        if currentQuoteIndex < 0 {
            
            currentQuoteIndex = 0
            
            return currentQuoteIndex
            
        } else {
            
            return currentQuoteIndex
        }
    }
    
    
    /**  Alpha Help */
    func interiorViewsAlphasAre(alpha: CGFloat) {
        
        quote.alpha = alpha
        shareButtonOutlet.alpha = alpha
        inPartnerLabel.alpha = alpha
        linkToKVMLOutlet.alpha = alpha
        trademarkLabel.alpha = alpha
    }
    
    
    
    //MARK: Checks notification reminder and its helper functions (called in tap action's
    // first tap).
    
    /** The function checks the current time against the notification time.  If the user opens the app before their reminder goes off that day, it cancels the reminder and sets a new one to start tomorrow at their already specified time.*/
    func doNotShowReminderTodayIfAppOpenedBeforeScheduledReminder(){
        
        let notificationTime = NSUserDefaults.standardUserDefaults().objectForKey("notificationTime") as? NSDate
        
        if let notificationTime = notificationTime {
            
            let currentTime = NSDate()
            let calendar = NSCalendar.currentCalendar()
            
            let notificationTimeComponents = notificationTimeOfDayComponents(notificationTime)
            
            let beginningOfToday = calendar.startOfDayForDate(currentTime) as NSDate
            
            let todaysNotificationTime = calendar.dateByAddingComponents(notificationTimeComponents,
                toDate: beginningOfToday,
                options: [])!
            
            
            if currentTime.compare(todaysNotificationTime) == NSComparisonResult.OrderedAscending {
                
                let newTime = newNotificationTime(notificationTime)
                
                setUpNotification(newTime)
                
            } else {
                
                // do nothing
                print("app opened after reminder sent.")
            }
        }
    }
    
    
    
    /** Sets the new notification time by getting the current date, adding a day to it,
     setting it to the beginning of that day, then adding the notification time of
     day to it. */
    func newNotificationTime(notificationTime: NSDate) -> NSDate {
        
        let currentDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        
        let dayInSeconds:Double = 86399
        
        let tomorrow = currentDate.dateByAddingTimeInterval(+dayInSeconds)
        
        let beginningOfTomorrow = calendar.startOfDayForDate(tomorrow) as NSDate
        
        let notificationTimeOfDay = notificationTimeOfDayComponents(notificationTime)
        
        //Add notificationTimeOfDay to BeginningOfTomorrow
        let newNotificationTime = calendar.dateByAddingComponents(notificationTimeOfDay,
            toDate: beginningOfTomorrow,
            options: [])!
        
        return newNotificationTime
        
    }
    
    
    
    /** Gets the time of day components of notificationTime parameter */
    func notificationTimeOfDayComponents(notificationTime: NSDate) -> NSDateComponents {
        
        let notificationTimeOfDayDateComponents = NSDateComponents()
        notificationTimeOfDayDateComponents.month = 0
        notificationTimeOfDayDateComponents.day = 0
        notificationTimeOfDayDateComponents.hour = notificationTime.hourIntoInteger
        notificationTimeOfDayDateComponents.minute = notificationTime.minuteIntoInteger
        notificationTimeOfDayDateComponents.second = notificationTime.secondIntoInteger
        
        return notificationTimeOfDayDateComponents
        
    }
    
    
    /** Sets up a new notification, scheduled to go off at the
     time set by the date parameter. */
    func  setUpNotification(date: NSDate) {
        
        cancelCurrentNotification()
        
        let notification = UILocalNotification()
        notification.alertBody = "Hello, friendly quote reminder."
        notification.fireDate = date
        notification.repeatInterval = NSCalendarUnit.Day
        notification.timeZone = NSTimeZone.defaultTimeZone()
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    /** Cancels all notifications in the app. */
    func cancelCurrentNotification() {
        
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    
    

    //MARK: - Action: Share Action (UIActivityController) and its helper functions
    @IBAction func shareAction(sender: AnyObject) {
        
        showActivityController()
    }
    

    func showActivityController() {
        
        // Build general message
        let source = "- Vonnegut a Day"
        let quote = quotes[getCurrentQuoteIndex()].phrase
        let work = quotes[getCurrentQuoteIndex()].work
        
        let generalMessage = "\(quote) \n \n \(source)"
        
        
        //Build email message
        let appLink = "<a href=\"https://itunes.apple.com/us/app/vonnegut-a-day/id1061528991?ls=1&mt=8\">Vonnegut a Day</a>"
        
        let emailMessage = "<html><body><div><p>I thought you would like this quote from Kurt Vonnegut:</p><p>\"\(quote)\"</p><p>- \(work)</p> <p>From the \(appLink) app</p></div></body></html>"
        
        
        //Build activity item
        let activityItem = ActivityItem(generalMessage: generalMessage, emailMessage: emailMessage)
        
        
        //Create activityController
        let activityController:UIActivityViewController = UIActivityViewController(activityItems: [activityItem], applicationActivities: nil)
        
        
        //Set email's subject line
        let emailSubjectLine = "\"Vonnegut a Day\""
        activityController.setValue(emailSubjectLine, forKey: "Subject")
        
        
        //Exclude fb because they are assholes and won't let you paste your text in.
        activityController.excludedActivityTypes = [UIActivityTypePostToFacebook]
        
        
        self.presentViewController(activityController, animated: true, completion: nil)
    }
    
    

    
    //MARK: - Action: Kurt Vonnegut Memorial Library Link
    /** Segue carried out in storyboard. */
    @IBAction func linkToKVML(sender: AnyObject) {
        
    }
    

    
    //MARK: - Navigation
    @IBAction func unwindBackToQuoteViewController(segue: UIStoryboardSegue){
        
    }
    
}