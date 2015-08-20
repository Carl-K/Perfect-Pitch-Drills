//
//  twoKnobRangeSlider.swift
//  test
//
//  Created by Student on 6/1/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class twoKnobRangeSlider: UIControl {
    
    var trackTintColor = UIColor(white: 0.9, alpha: 1.0)
    var trackHighlightTintColor = UIColor(red: 0.0, green: 0.45, blue: 0.94, alpha: 1.0)
    var thumbTintColor = UIColor.whiteColor()
    
    var curvaceousness : CGFloat = 1.0
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    //var minVal : Double = 0.0
    var range : Double = 3.0
    var lowerKnobVal : Double = 0.0
    var upperKnobVal : Double = 100.0
    var shift : Double = 3.0
    
    var lowerKnobTouched = false
    var upperKnobTouched = false
    
    let bar = CALayer()
    let lowerKnob = CALayer()
    let upperKnob = CALayer()
    
    var knobSize : CGFloat = 0.0
    
    var shouldStep = true
    
    var previousLocation : CGPoint = CGPoint()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        knobSize = frame.height
        
        //setup and display bar
        bar.backgroundColor = UIColor.blueColor().CGColor
        bar.frame = CGRect(x: frame.height / 2, y: (frame.height / 2) - 1, width: frame.width - frame.height, height: 2)
        layer.addSublayer(bar)
        
        //setup and display lower knob
        lowerKnob.backgroundColor = UIColor.grayColor().CGColor
        lowerKnob.frame = CGRect(x: (CGFloat(lowerKnobVal / 100.0) / (bounds.width - knobSize)), y: 0, width: frame.height, height: frame.height)
        layer.addSublayer(lowerKnob)

        //setup and display upper knob
        upperKnob.backgroundColor = UIColor.grayColor().CGColor
        upperKnob.frame = CGRect(x: (CGFloat(upperKnobVal / 100.0) * (bounds.width - knobSize)), y: 0, width: frame.height, height: frame.height)
        layer.addSublayer(upperKnob)
        
        lowerKnobVal = clamp(lowerKnobVal, minVal: /*minVal*/0, maxVal: upperKnobVal)
        upperKnobVal = Double(Int( clamp(upperKnobVal, minVal: /*minVal*/0, maxVal: /*maxVal*/range) % ( /*maxVal - minVal*/range + 1)))

    }
    
    required init(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    func positionForValue(value: Double) -> Double {
        return Double(bounds.width - knobSize) * (value/* - minVal*/) /
            /*(maxVal - minVal)*/range + Double(knobSize / 2.0)
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        
        //get touched location
        var touchLocation : CGPoint = touch.locationInView(self)
        
        //check if any of the two knobs were touched
        if (lowerKnob.frame.contains(touchLocation))
        {
            lowerKnobTouched = true
        }
        else if (upperKnob.frame.contains(touchLocation))
        {
            upperKnobTouched = true
        }
        
        //update last touched location
        previousLocation = touchLocation
        
        //return if any of the two knobs were touched
        return (lowerKnobTouched || upperKnobTouched)
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        
        var touchLocation : CGPoint = touch.locationInView(self)
        
        //calculate drag based on screen size
        let xDragged : Double = Double(touchLocation.x - previousLocation.x)
        
        //calculate value change based on slider size
        var valueChange : Double = /*(maxVal - minVal)*/range * xDragged / Double(bounds.width - knobSize)
        
        //update last touched location
        previousLocation = touchLocation
        
        //update knob value and knob position
        if (lowerKnobTouched == true)
        {
            if (lowerKnobVal < upperKnobVal)
            {
                lowerKnobVal += valueChange
                lowerKnobVal = clamp(lowerKnobVal, minVal: /*minVal*/0, maxVal: upperKnobVal)
            
                lowerKnob.position.x += CGFloat(xDragged)
                lowerKnob.position = CGPointMake(CGFloat( clamp( Double(lowerKnob.position.x), minVal: Double(bounds.minX + knobSize / 2), maxVal: Double(upperKnob.position.x - knobSize / 2) ) ), lowerKnob.position.y )
            }
        }
        else if (upperKnobTouched == true)
        {
            if (upperKnobVal > lowerKnobVal)
            {
                upperKnobVal += valueChange
                upperKnobVal = clamp(upperKnobVal, minVal: lowerKnobVal, maxVal: /*maxVal*/range)
            
                upperKnob.position.x += CGFloat(xDragged)
                upperKnob.position = CGPointMake(CGFloat( clamp( Double(upperKnob.position.x), minVal: Double(lowerKnob.position.x + knobSize / 2), maxVal: Double(bounds.maxX - knobSize / 2) ) ), upperKnob.position.y )
            }
        }
        
        return true
    }
    
    override func endTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) {
        
        if (shouldStep)
        {
            lowerKnobVal = Double(Int( clamp(lowerKnobVal, minVal: /*minVal*/0, maxVal: /*maxVal*/range) % /*( maxVal - minVal)*/range))
            if (lowerKnobTouched && upperKnobVal == lowerKnobVal)
            {
                lowerKnobVal -= 1
            }
            //NSLog("%f", lowerKnobVal)
            //NSLog("%f", lowerKnobVal)
            //NSLog("%f", Double(Int(lowerKnobVal)))/*
            //NSLog("%f", Double(Int( clamp(lowerKnobVal, minVal: minVal, maxVal: maxVal) % ( maxVal - minVal))))
            
            lowerKnob.position.x = ((frame.maxX - frame.minX) * CGFloat( lowerKnobVal / /*maxVal - minVal*/range)) + (knobSize / 2)
        }
        
        if (shouldStep)
        {
            upperKnobVal = Double(Int( clamp(upperKnobVal, minVal: /*minVal*/0, maxVal: /*maxVal*/range) % ( /*maxVal - minVal*/range + 1)))
            if (upperKnobTouched && upperKnobVal == lowerKnobVal)
            {
                upperKnobVal += 1
            }
            //NSLog("%f", upperKnobVal)
            //NSLog("%f", upperKnobVal)
            //NSLog("%f", Double(Int(upperKnobVal)))
            //NSLog("%f", Double(Int( clamp(upperKnobVal, minVal: minVal, maxVal: maxVal) % ( maxVal - minVal + 1))))
            
            lowerKnobTouched = false
            upperKnobTouched = false
            upperKnob.position.x = ((frame.maxX - frame.minX) * CGFloat( upperKnobVal / /*(maxVal - minVal)*/range)) - (knobSize / 2)
        }
        
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func clamp(currVal: Double, minVal: Double, maxVal: Double) -> Double
    {
        return min(max(minVal, currVal), maxVal)
    }
    
    func getLower() -> Double
    {
        return lowerKnobVal + shift
    }
    
    func getUpper() -> Double
    {
        return upperKnobVal + shift
    }
    
}

