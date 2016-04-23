//
//  ActivityItem.swift
//  Vonnegut a Day
//
//  Created by Alexis Jensen on 2015-12-15.
//  Copyright © 2015 beep. All rights reserved.
//

import UIKit

class ActivityItem: UIActivityItemProvider {
    
    var generalMessage: String!
    var emailMessage: String!
    
    
    init(generalMessage: String, emailMessage: String) {
     
        self.generalMessage = generalMessage
        self.emailMessage = emailMessage
        
        super.init(placeholderItem: generalMessage)
    }
    
   
    override func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
      
        if activityType == UIActivityTypeMail {
         
            return NSString(string: emailMessage)
       
        } else {
          
            return NSString(string: generalMessage)
        }
    }

}
