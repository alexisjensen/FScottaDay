//
//  RoundedButton.swift
//  Vonnegut a Day
//
//  Created by Alexis Jensen on 2015-10-23.
//  Copyright © 2015 beep. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {

    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = 9
        self.clipsToBounds = true
    }

}
