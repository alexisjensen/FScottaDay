//
//  NSDateExtension.swift
//  Vonnegut a Day
//
//  Created by Alexis Jensen on 2015-12-24.
//  Copyright © 2015 beep. All rights reserved.
//

import Foundation

extension NSDate  {
    
    var hourIntoInteger: Int {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh"
        dateFormatter.stringFromDate(self)
        return Int(dateFormatter.stringFromDate(self))!
    }
    
    var minuteIntoInteger: Int {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "mm"
        dateFormatter.stringFromDate(self)
        return Int(dateFormatter.stringFromDate(self))!
    }
    
    var secondIntoInteger: Int {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "ss"
        dateFormatter.stringFromDate(self)
        return Int(dateFormatter.stringFromDate(self))!
    }
    
    

}
