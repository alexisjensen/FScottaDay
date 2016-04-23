//
//  AssholeView.swift
//  Vonnegut a Day
//
//  Created by Alexis Jensen on 2015-12-06.
//  Copyright © 2015 beep. All rights reserved.
//

import UIKit

@IBDesignable
class AssholeView: UIView {
    
    var backgroundLayer = CAShapeLayer()
    var bezierPath = UIBezierPath()
    var rectanglePath = UIBezierPath()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
        
    }
    
    
    func setup(){
        
        let assholeLayer = buildAssholeLayer()
        self.layer.backgroundColor = UIColor.clearColor().CGColor
       
        self.layer.addSublayer(assholeLayer)
        assholeLayer.frame = CGRect(x:CGRectGetMinX(self.bounds),y:CGRectGetMinY(self.bounds),width: 200,height: 200)
        assholeLayer.position = CGPoint(x:55,y:90)
        
    }
    
//    let myLayer = CALayer()
//    self.view.layer.addSublayer(myLayer)
//    myLayer.frame = CGRect(x:CGRectGetMinX(self.view.bounds),y:CGRectGetMinY(self.view.bounds),width: 200,height: 200)
//    myLayer.position = CGPoint(x:200,y:200)
//    myLayer.backgroundColor = UIColor.blueColor().CGColor
//    let mySubLayer = CALayer()
//    mySubLayer.frame = CGRect(x:CGRectGetMinX(myLayer.bounds),y:CGRectGetMinY(myLayer.bounds),width: CGRectGetWidth(myLayer.frame)/2,height: CGRectGetHeight(myLayer.frame)/2)
//    mySubLayer.backgroundColor = UIColor.yellowColor().CGColor
//    myLayer.addSublayer(mySubLayer)
    
    
    
    func buildAssholeLayer() -> CAShapeLayer {
        
        let width = self.bounds.width
        let height = self.bounds.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        backgroundLayer.bounds = bounds
        backgroundLayer.position = self.center
            
    
        
        backgroundLayer.path = buildAssholeBezier().CGPath
        
 
        backgroundLayer.fillColor = UIColor.whiteColor().CGColor
        
        return backgroundLayer
        
    }
    
    
    
    
    
    
    func buildAssholeBezier() -> UIBezierPath {
        
        //Build Bezier
        bezierPath.moveToPoint(CGPointMake(193.82, 66.62))
        bezierPath.addCurveToPoint(CGPointMake(190.04, 59.47), controlPoint1: CGPointMake(193.1, 60.97), controlPoint2: CGPointMake(190.44, 59.59))
        bezierPath.addCurveToPoint(CGPointMake(181.76, 60.77), controlPoint1: CGPointMake(188.13, 59.61), controlPoint2: CGPointMake(181.96, 60.73))
        bezierPath.addCurveToPoint(CGPointMake(143.11, 67.75), controlPoint1: CGPointMake(163.52, 61.77), controlPoint2: CGPointMake(146.62, 66.69))
        bezierPath.addCurveToPoint(CGPointMake(144.99, 65.86), controlPoint1: CGPointMake(143.53, 67.25), controlPoint2: CGPointMake(144.23, 66.53))
        bezierPath.addLineToPoint(CGPointMake(150.54, 60.39))
        bezierPath.addCurveToPoint(CGPointMake(158.1, 52.91), controlPoint1: CGPointMake(153.69, 58.88), controlPoint2: CGPointMake(157.86, 53.27))
        bezierPath.addCurveToPoint(CGPointMake(163.22, 45.71), controlPoint1: CGPointMake(159.57, 49.32), controlPoint2: CGPointMake(163.23, 45.71))
        bezierPath.addCurveToPoint(CGPointMake(165.69, 42.64), controlPoint1: CGPointMake(165.33, 44.14), controlPoint2: CGPointMake(165.75, 43.19))
        bezierPath.addCurveToPoint(CGPointMake(169.66, 34.9), controlPoint1: CGPointMake(166.37, 41.28), controlPoint2: CGPointMake(169.66, 34.9))
        bezierPath.addLineToPoint(CGPointMake(169.95, 34.35))
        bezierPath.addLineToPoint(CGPointMake(158.05, 30.03))
        bezierPath.addCurveToPoint(CGPointMake(152.07, 33.91), controlPoint1: CGPointMake(154.33, 31.29), controlPoint2: CGPointMake(152.26, 33.63))
        bezierPath.addCurveToPoint(CGPointMake(145.89, 44.09), controlPoint1: CGPointMake(150.81, 37.59), controlPoint2: CGPointMake(145.95, 44.02))
        bezierPath.addCurveToPoint(CGPointMake(129.4, 67.54), controlPoint1: CGPointMake(145.61, 44.49), controlPoint2: CGPointMake(129.44, 67.47))
        bezierPath.addCurveToPoint(CGPointMake(129.22, 67.87), controlPoint1: CGPointMake(129.32, 67.7), controlPoint2: CGPointMake(129.25, 67.8))
        bezierPath.addCurveToPoint(CGPointMake(128.33, 63.53), controlPoint1: CGPointMake(128.89, 67.34), controlPoint2: CGPointMake(128.49, 65.43))
        bezierPath.addCurveToPoint(CGPointMake(121.35, 36.44), controlPoint1: CGPointMake(128.33, 62.49), controlPoint2: CGPointMake(122.55, 40.88))
        bezierPath.addCurveToPoint(CGPointMake(115.95, 21.24), controlPoint1: CGPointMake(119.3, 32.67), controlPoint2: CGPointMake(115.98, 21.31))
        bezierPath.addCurveToPoint(CGPointMake(115.95, 14.42), controlPoint1: CGPointMake(115.73, 20.12), controlPoint2: CGPointMake(115.88, 15.94))
        bezierPath.addLineToPoint(CGPointMake(115.97, 14.16))
        bezierPath.addLineToPoint(CGPointMake(115.77, 13.99))
        bezierPath.addCurveToPoint(CGPointMake(113.9, 13.56), controlPoint1: CGPointMake(115.44, 13.69), controlPoint2: CGPointMake(114.87, 13.56))
        bezierPath.addCurveToPoint(CGPointMake(111.3, 13.84), controlPoint1: CGPointMake(112.79, 13.56), controlPoint2: CGPointMake(111.53, 13.75))
        bezierPath.addCurveToPoint(CGPointMake(110.49, 14.06), controlPoint1: CGPointMake(111.17, 13.91), controlPoint2: CGPointMake(110.64, 13.97))
        bezierPath.addCurveToPoint(CGPointMake(107.9, 14.34), controlPoint1: CGPointMake(109.38, 13.3), controlPoint2: CGPointMake(108.2, 13.83))
        bezierPath.addCurveToPoint(CGPointMake(107.61, 14.64), controlPoint1: CGPointMake(107.86, 14.42), controlPoint2: CGPointMake(107.63, 14.62))
        bezierPath.addCurveToPoint(CGPointMake(102.57, 17.43), controlPoint1: CGPointMake(105.37, 14.64), controlPoint2: CGPointMake(102.74, 17.26))
        bezierPath.addCurveToPoint(CGPointMake(100.07, 21.09), controlPoint1: CGPointMake(100.88, 19.71), controlPoint2: CGPointMake(100.26, 20.63))
        bezierPath.addCurveToPoint(CGPointMake(98.78, 25.31), controlPoint1: CGPointMake(98.18, 22.62), controlPoint2: CGPointMake(98.75, 25.18))
        bezierPath.addCurveToPoint(CGPointMake(100.16, 28.97), controlPoint1: CGPointMake(99.51, 28.09), controlPoint2: CGPointMake(100.05, 29.05))
        bezierPath.addCurveToPoint(CGPointMake(110.01, 59.92), controlPoint1: CGPointMake(101.18, 40.94), controlPoint2: CGPointMake(109.91, 59.71))
        bezierPath.addCurveToPoint(CGPointMake(110.88, 61.92), controlPoint1: CGPointMake(110.44, 60.73), controlPoint2: CGPointMake(110.71, 61.42))
        bezierPath.addCurveToPoint(CGPointMake(96.19, 51.6), controlPoint1: CGPointMake(108.19, 60.7), controlPoint2: CGPointMake(100.77, 55.21))
        bezierPath.addCurveToPoint(CGPointMake(95.18, 51.1), controlPoint1: CGPointMake(95.79, 51.27), controlPoint2: CGPointMake(95.14, 51.07))
        bezierPath.addCurveToPoint(CGPointMake(77.92, 41.84), controlPoint1: CGPointMake(86.5, 43.04), controlPoint2: CGPointMake(80.64, 41.84))
        bezierPath.addCurveToPoint(CGPointMake(76.64, 41.96), controlPoint1: CGPointMake(77.12, 41.84), controlPoint2: CGPointMake(76.69, 41.94))
        bezierPath.addLineToPoint(CGPointMake(76.29, 42.25))
        bezierPath.addCurveToPoint(CGPointMake(71.73, 47.51), controlPoint1: CGPointMake(74.73, 45.58), controlPoint2: CGPointMake(71.8, 47.46))
        bezierPath.addCurveToPoint(CGPointMake(69.53, 52.09), controlPoint1: CGPointMake(69.33, 49.33), controlPoint2: CGPointMake(69.21, 51))
        bezierPath.addCurveToPoint(CGPointMake(72.59, 55), controlPoint1: CGPointMake(70.03, 53.79), controlPoint2: CGPointMake(71.91, 54.95))
        bezierPath.addCurveToPoint(CGPointMake(75.45, 55.25), controlPoint1: CGPointMake(73.24, 55.06), controlPoint2: CGPointMake(75.37, 55.38))
        bezierPath.addCurveToPoint(CGPointMake(103.99, 72.81), controlPoint1: CGPointMake(77.69, 58.31), controlPoint2: CGPointMake(98.31, 69.7))
        bezierPath.addLineToPoint(CGPointMake(87.49, 75.46))
        bezierPath.addCurveToPoint(CGPointMake(77.04, 77.01), controlPoint1: CGPointMake(83.31, 75.46), controlPoint2: CGPointMake(77.27, 76.96))
        bezierPath.addCurveToPoint(CGPointMake(46.63, 83.66), controlPoint1: CGPointMake(59.33, 80.71), controlPoint2: CGPointMake(46.75, 83.63))
        bezierPath.addLineToPoint(CGPointMake(46.36, 83.72))
        bezierPath.addLineToPoint(CGPointMake(45.93, 84.85))
        bezierPath.addLineToPoint(CGPointMake(45.93, 85.85))
        bezierPath.addCurveToPoint(CGPointMake(45.02, 87), controlPoint1: CGPointMake(45.6, 86.15), controlPoint2: CGPointMake(45.25, 86.64))
        bezierPath.addCurveToPoint(CGPointMake(47.07, 90.19), controlPoint1: CGPointMake(44.27, 88.61), controlPoint2: CGPointMake(46.86, 90.09))
        bezierPath.addCurveToPoint(CGPointMake(59.26, 93.8), controlPoint1: CGPointMake(50.76, 93.32), controlPoint2: CGPointMake(59.29, 93.88))
        bezierPath.addCurveToPoint(CGPointMake(62.73, 94.43), controlPoint1: CGPointMake(60.63, 94.22), controlPoint2: CGPointMake(61.8, 94.43))
        bezierPath.addCurveToPoint(CGPointMake(64.31, 94.05), controlPoint1: CGPointMake(63.97, 94.43), controlPoint2: CGPointMake(64.29, 94.09))
        bezierPath.addCurveToPoint(CGPointMake(86.09, 90.12), controlPoint1: CGPointMake(65.26, 93.88), controlPoint2: CGPointMake(86.12, 90.14))
        bezierPath.addLineToPoint(CGPointMake(87.2, 90.26))
        bezierPath.addLineToPoint(CGPointMake(88.39, 89.95))
        bezierPath.addCurveToPoint(CGPointMake(103.4, 88.5), controlPoint1: CGPointMake(89.04, 89.77), controlPoint2: CGPointMake(97.72, 88.99))
        bezierPath.addCurveToPoint(CGPointMake(105.45, 88.47), controlPoint1: CGPointMake(104.19, 88.44), controlPoint2: CGPointMake(104.89, 88.44))
        bezierPath.addCurveToPoint(CGPointMake(81.42, 108.27), controlPoint1: CGPointMake(93.05, 98.03), controlPoint2: CGPointMake(81.64, 108.04))
        bezierPath.addCurveToPoint(CGPointMake(77.36, 122.61), controlPoint1: CGPointMake(76.36, 116.84), controlPoint2: CGPointMake(77.33, 122.47))
        bezierPath.addCurveToPoint(CGPointMake(81.27, 128.57), controlPoint1: CGPointMake(77.36, 123.47), controlPoint2: CGPointMake(79.8, 126.7))
        bezierPath.addCurveToPoint(CGPointMake(86.3, 131.78), controlPoint1: CGPointMake(83.05, 130.7), controlPoint2: CGPointMake(84.74, 131.78))
        bezierPath.addCurveToPoint(CGPointMake(90.19, 128.56), controlPoint1: CGPointMake(88.96, 131.78), controlPoint2: CGPointMake(90.13, 128.73))
        bezierPath.addCurveToPoint(CGPointMake(97.38, 119.54), controlPoint1: CGPointMake(91.4, 124.48), controlPoint2: CGPointMake(97.37, 119.55))
        bezierPath.addCurveToPoint(CGPointMake(104.99, 110.83), controlPoint1: CGPointMake(102.39, 116.33), controlPoint2: CGPointMake(104.89, 111.03))
        bezierPath.addCurveToPoint(CGPointMake(110.03, 104.75), controlPoint1: CGPointMake(106.67, 107.63), controlPoint2: CGPointMake(110.03, 104.76))
        bezierPath.addCurveToPoint(CGPointMake(119.73, 95.42), controlPoint1: CGPointMake(115.95, 100.5), controlPoint2: CGPointMake(119.7, 95.92))
        bezierPath.addCurveToPoint(CGPointMake(119.76, 97.78), controlPoint1: CGPointMake(119.84, 95.71), controlPoint2: CGPointMake(119.85, 96.69))
        bezierPath.addCurveToPoint(CGPointMake(124.27, 116.04), controlPoint1: CGPointMake(120.24, 99.6), controlPoint2: CGPointMake(124.25, 115.99))
        bezierPath.addCurveToPoint(CGPointMake(136.58, 152.56), controlPoint1: CGPointMake(136.09, 148.33), controlPoint2: CGPointMake(136.56, 152.38))
        bezierPath.addCurveToPoint(CGPointMake(140.3, 157.05), controlPoint1: CGPointMake(136.96, 156.47), controlPoint2: CGPointMake(139.07, 157.05))
        bezierPath.addCurveToPoint(CGPointMake(143.32, 156.13), controlPoint1: CGPointMake(141.79, 157.05), controlPoint2: CGPointMake(143.15, 156.25))
        bezierPath.addCurveToPoint(CGPointMake(148.89, 153.49), controlPoint1: CGPointMake(143.88, 155.55), controlPoint2: CGPointMake(146.89, 154.31))
        bezierPath.addCurveToPoint(CGPointMake(149.67, 146.22), controlPoint1: CGPointMake(151.09, 150.65), controlPoint2: CGPointMake(149.7, 146.27))
        bezierPath.addCurveToPoint(CGPointMake(146.42, 129.04), controlPoint1: CGPointMake(149.21, 138.79), controlPoint2: CGPointMake(146.46, 129.16))
        bezierPath.addCurveToPoint(CGPointMake(138.19, 97.24), controlPoint1: CGPointMake(139, 106.75), controlPoint2: CGPointMake(138.18, 99.4))
        bezierPath.addLineToPoint(CGPointMake(151.18, 107.22))
        bezierPath.addCurveToPoint(CGPointMake(154.62, 110.86), controlPoint1: CGPointMake(152.81, 108.15), controlPoint2: CGPointMake(154.46, 110.69))
        bezierPath.addCurveToPoint(CGPointMake(164.25, 119.04), controlPoint1: CGPointMake(157.23, 112.69), controlPoint2: CGPointMake(164.19, 118.98))
        bezierPath.addCurveToPoint(CGPointMake(167.83, 123.06), controlPoint1: CGPointMake(166, 120.66), controlPoint2: CGPointMake(167.73, 123.06))
        bezierPath.addLineToPoint(CGPointMake(167.83, 123.06))
        bezierPath.addCurveToPoint(CGPointMake(169.55, 124.93), controlPoint1: CGPointMake(167.84, 123.26), controlPoint2: CGPointMake(167.89, 123.73))
        bezierPath.addCurveToPoint(CGPointMake(171.53, 127.26), controlPoint1: CGPointMake(170.12, 125.99), controlPoint2: CGPointMake(171.18, 126.96))
        bezierPath.addCurveToPoint(CGPointMake(173.31, 129.39), controlPoint1: CGPointMake(171.68, 127.56), controlPoint2: CGPointMake(172.11, 128.13))
        bezierPath.addCurveToPoint(CGPointMake(175.2, 130.42), controlPoint1: CGPointMake(174.57, 130.34), controlPoint2: CGPointMake(174.95, 130.42))
        bezierPath.addLineToPoint(CGPointMake(175.62, 130.38))
        bezierPath.addLineToPoint(CGPointMake(175.78, 130.08))
        bezierPath.addCurveToPoint(CGPointMake(175.79, 129.44), controlPoint1: CGPointMake(175.82, 130), controlPoint2: CGPointMake(175.92, 129.81))
        bezierPath.addCurveToPoint(CGPointMake(181.82, 125.59), controlPoint1: CGPointMake(176.55, 129.03), controlPoint2: CGPointMake(178.18, 128.03))
        bezierPath.addCurveToPoint(CGPointMake(186.08, 117.5), controlPoint1: CGPointMake(184.54, 123.37), controlPoint2: CGPointMake(186.01, 117.82))
        bezierPath.addCurveToPoint(CGPointMake(182.55, 111.35), controlPoint1: CGPointMake(186.38, 114.24), controlPoint2: CGPointMake(182.97, 111.57))
        bezierPath.addCurveToPoint(CGPointMake(179.38, 107.74), controlPoint1: CGPointMake(181.61, 111.25), controlPoint2: CGPointMake(180.18, 109.25))
        bezierPath.addCurveToPoint(CGPointMake(160.1, 94.81), controlPoint1: CGPointMake(178.32, 106.61), controlPoint2: CGPointMake(169.47, 100.88))
        bezierPath.addCurveToPoint(CGPointMake(141.8, 82.93), controlPoint1: CGPointMake(151.65, 89.35), controlPoint2: CGPointMake(142.93, 83.69))
        bezierPath.addCurveToPoint(CGPointMake(142.63, 82.83), controlPoint1: CGPointMake(141.81, 82.92), controlPoint2: CGPointMake(141.97, 82.83))
        bezierPath.addCurveToPoint(CGPointMake(144.61, 82.98), controlPoint1: CGPointMake(143.47, 82.83), controlPoint2: CGPointMake(144.44, 82.98))
        bezierPath.addCurveToPoint(CGPointMake(157.38, 80.05), controlPoint1: CGPointMake(149.6, 82.35), controlPoint2: CGPointMake(157.28, 80.08))
        bezierPath.addCurveToPoint(CGPointMake(171.05, 77.32), controlPoint1: CGPointMake(162.15, 78.38), controlPoint2: CGPointMake(170.91, 77.34))
        bezierPath.addCurveToPoint(CGPointMake(171.67, 77.28), controlPoint1: CGPointMake(171.13, 77.31), controlPoint2: CGPointMake(171.3, 77.28))
        bezierPath.addCurveToPoint(CGPointMake(176.03, 77.62), controlPoint1: CGPointMake(173.1, 77.28), controlPoint2: CGPointMake(175.7, 77.68))
        bezierPath.addCurveToPoint(CGPointMake(179.38, 77.33), controlPoint1: CGPointMake(176.3, 77.51), controlPoint2: CGPointMake(177.1, 77.33))
        bezierPath.addCurveToPoint(CGPointMake(182.26, 77.41), controlPoint1: CGPointMake(180.88, 77.33), controlPoint2: CGPointMake(182.25, 77.41))
        bezierPath.addLineToPoint(CGPointMake(182.52, 77.43))
        bezierPath.addLineToPoint(CGPointMake(182.89, 76.83))
        bezierPath.addLineToPoint(CGPointMake(186.02, 76.27))
        bezierPath.addCurveToPoint(CGPointMake(189.63, 76.04), controlPoint1: CGPointMake(188.7, 76.41), controlPoint2: CGPointMake(189.61, 76.06))
        bezierPath.addCurveToPoint(CGPointMake(193.09, 73.67), controlPoint1: CGPointMake(191.16, 75.7), controlPoint2: CGPointMake(192.32, 74.9))
        bezierPath.addCurveToPoint(CGPointMake(193.82, 66.62), controlPoint1: CGPointMake(194.85, 70.85), controlPoint2: CGPointMake(193.86, 66.73))
        bezierPath.closePath()
        
        return bezierPath
        
    }
    
    
    //    func animate() {
    //
    //        let animation = CABasicAnimation(keyPath: "path")
    //        animation.toValue = rectanglePath
    //        animation.duration = 1 // duration is 1 sec
    //
    //        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
    //        animation.fillMode = kCAFillModeBoth // keep to value after finishing
    //        animation.removedOnCompletion = false // don't remove after finishing
    //
    //     backgroundLayer.addAnimation(animation, forKey: animation.keyPath)
    //        
    //    }

    
}
