//
//  ViewController.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 5/22/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let BUTTON_FONT : CGFloat = 64.0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let stats = statsButton.titleLabel
        {
            stats.font! = stats.font!.fontWithSize(BUTTON_FONT)
            stats.sizeToFit()
        }
        
        if let start = startButton.titleLabel
        {
            start.font! = start.font!.fontWithSize(BUTTON_FONT)
            start.sizeToFit()
        }
        
        if let piano = pianoButton.titleLabel
        {
            piano.font! = piano.font!.fontWithSize(BUTTON_FONT)
            piano.sizeToFit()
        }
        
        startButton.updateConstraints()
        statsButton.updateConstraints()
        pianoButton.updateConstraints()
        /*
        var startConstraint = NSLayoutConstraint(item: self.startButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.statsButton, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraint( startConstraint )
        
        startConstraint = NSLayoutConstraint(item: self.startButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraint( startConstraint )
        
        var pianoConstraint = NSLayoutConstraint(item: self.pianoButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.statsButton, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraint( pianoConstraint )
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var pianoButton: UIButton!
}

/*

//
//  twoKnobRangeSlider.swift
//  test
//
//  Created by Student on 6/1/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import QuartzCore

class twoKnobRangeSlider: UIControl {

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func drawRect(rect: CGRect) {
// Drawing code
}
*/

var minVal : Double = 0.0
var maxVal : Double = 10.0
var lowerKnobVal : Double = 0.0
var upperKnobVal : Double = 100.0

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

backgroundColor = UIColor.redColor()

knobSize = frame.height

//setup and display bar
bar.backgroundColor = UIColor.blueColor().CGColor
bar.frame = CGRect(x: frame.height / 2, y: (frame.height / 2) - 1, width: frame.width - frame.height, height: 2)

//setup and display lower knob
lowerKnob.backgroundColor = UIColor.grayColor().CGColor
lowerKnob.frame = CGRect(x: (CGFloat(lowerKnobVal / 100.0) / (bounds.width - knobSize)), y: 0, width: frame.height, height: frame.height)
layer.addSublayer(lowerKnob)

//setup and display upper knob
upperKnob.backgroundColor = UIColor.grayColor().CGColor
upperKnob.frame = CGRect(x: (CGFloat(upperKnobVal / 100.0) * (bounds.width - knobSize)), y: 0, width: frame.height, height: frame.height)
layer.addSublayer(upperKnob)

layer.addSublayer(bar)

//updateLayers()
}

required init(coder : NSCoder) {
super.init(coder: coder)
}

func updateLayers()
{
/*
//setup and display bar
//bar.backgroundColor = UIColor.blueColor().CGColor
bar.frame = CGRect(x: frame.height / 2, y: (frame.height / 2) - 1, width: frame.width - frame.height, height: 2)

//setup and display lower knob
//lowerKnob.backgroundColor = UIColor.grayColor().CGColor
lowerKnob.frame = CGRect(x: (CGFloat(lowerKnobVal / 100.0) / (bounds.width - knobSize)), y: 0, width: frame.height, height: frame.height)
lowerKnob.setNeedsDisplay()

//setup and display upper knob
//upperKnob.backgroundColor = UIColor.grayColor().CGColor
upperKnob.frame = CGRect(x: (CGFloat(upperKnobVal / 100.0) * (bounds.width - knobSize)), y: 0, width: frame.height, height: frame.height)
upperKnob.setNeedsDisplay()

bar.setNeedsDisplay()
*/
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
var valueChange : Double = (maxVal - minVal) * xDragged / Double(bounds.width - knobSize)

//update last touched location
previousLocation = touchLocation

//update knob value and knob position
if (lowerKnobTouched == true)
{
lowerKnobVal += valueChange
lowerKnobVal = clamp(lowerKnobVal, minVal: minVal, maxVal: upperKnobVal)
//NSLog("%f", lowerKnobVal)


lowerKnob.position.x += CGFloat(xDragged)
lowerKnob.position = CGPointMake(CGFloat( clamp( Double(lowerKnob.position.x), minVal: Double(bounds.minX + knobSize / 2), maxVal: Double(upperKnob.position.x - knobSize / 2) ) ), lowerKnob.position.y )
}
else if (upperKnobTouched == true)
{
upperKnobVal += valueChange
upperKnobVal = clamp(upperKnobVal, minVal: lowerKnobVal, maxVal: maxVal)
//NSLog("%f", upperKnobVal)

upperKnob.position.x += CGFloat(xDragged)
upperKnob.position = CGPointMake(CGFloat( clamp( Double(upperKnob.position.x), minVal: Double(lowerKnob.position.x + knobSize / 2), maxVal: Double(bounds.maxX - knobSize / 2) ) ), upperKnob.position.y )
}

//CATransaction.begin()
//CATransaction.setDisableActions(false)
//updateLayers()
//CATransaction.commit()

return true
}

override func endTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) {

lowerKnobTouched = false
if (shouldStep)
{
lowerKnobVal = Double(Int( clamp(lowerKnobVal, minVal: minVal, maxVal: maxVal) % ( maxVal - minVal)))
//NSLog("%f", lowerKnobVal)
//NSLog("%f", lowerKnobVal)
//NSLog("%f", Double(Int(lowerKnobVal)))
//NSLog("%f", Double(Int( clamp(lowerKnobVal, minVal: minVal, maxVal: maxVal) % ( maxVal - minVal))))

lowerKnob.position.x = ((frame.maxX - frame.minX) * CGFloat( lowerKnobVal / maxVal - minVal)) + (knobSize / 2)
}

upperKnobTouched = false
if (shouldStep)
{
upperKnobVal = Double(Int( clamp(upperKnobVal, minVal: minVal, maxVal: maxVal) % ( maxVal - minVal + 1)))
//NSLog("%f", upperKnobVal)
//NSLog("%f", upperKnobVal)
//NSLog("%f", Double(Int(upperKnobVal)))
//NSLog("%f", Double(Int( clamp(upperKnobVal, minVal: minVal, maxVal: maxVal) % ( maxVal - minVal + 1))))

upperKnob.position.x = ((frame.maxX - frame.minX) * CGFloat( upperKnobVal / (maxVal - minVal))) - (knobSize / 2)
}
}

func clamp(currVal: Double, minVal: Double, maxVal: Double) -> Double
{
return min(max(minVal, currVal), maxVal)
}

}



*/

