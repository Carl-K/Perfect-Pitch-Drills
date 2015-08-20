//
//  QuartzView.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 6/7/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class QuartzView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineDash(context, 0, nil, 0)
        
        let rect1 = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        CGContextStrokeEllipseInRect(context, rect1)
        
        CGContextSetLineWidth(context, 4)
        let rect2 = CGRect(x: 15, y: 15, width: UIScreen.mainScreen().bounds.width - 30, height: UIScreen.mainScreen().bounds.height - 30)
        CGContextFillEllipseInRect(context, rect2)
        CGContextStrokeEllipseInRect(context, rect2)
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        let rect3 = CGRect(x: 35, y: 35, width: UIScreen.mainScreen().bounds.width - 70, height: UIScreen.mainScreen().bounds.height - 70)
        CGContextFillEllipseInRect(context, rect3)
        CGContextStrokeEllipseInRect(context, rect3)
        
        // Drawing text
        let text: NSString =  "Created By Carl Kruk\nDePaul University"
        
        var textAttr = [
            NSForegroundColorAttributeName : UIColor.blueColor(),
            NSFontAttributeName : UIFont(name: "Helvetica", size: 48.0)!
        ]
        text.drawAtPoint(CGPoint(x: UIScreen.mainScreen().bounds.width / 2 - 200, y: UIScreen.mainScreen().bounds.height / 2 - 50), withAttributes: textAttr)
        
        if let back = backButton.titleLabel
        {
            back.font! = back.font!.fontWithSize(24.0)
            back.sizeToFit()
        }
        
    }


    @IBOutlet weak var backButton: UIButton!
}
