//
//  SetupViewController.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 6/3/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class noteData
{
    var a : BooleanLiteralType = true
    var aB : BooleanLiteralType = true
    var b : BooleanLiteralType = true
    var c : BooleanLiteralType = true
    var cD : BooleanLiteralType = true
    var d : BooleanLiteralType = true
    var dE : BooleanLiteralType = true
    var e : BooleanLiteralType = true
    var f : BooleanLiteralType = true
    var fG : BooleanLiteralType = true
    var g : BooleanLiteralType = true
    var gA : BooleanLiteralType = true
    
    var rangeLo : Int = 0
    var rangeHi : Int = 13
    
    var reference : BooleanLiteralType = true
    var replayNote: BooleanLiteralType = true
    var selectOctave:BooleanLiteralType = true
    
    private init()
    {
        
    }
    
    class var sharedInstance : noteData
    {
        struct Static {
            static var instance : noteData?
        }
        
        if !(Static.instance != nil)
        {
            Static.instance = noteData();
        }
        
        return Static.instance!
    }
    
    func setNoteBool(note : String, enabled : BooleanLiteralType)
    {
        switch(note)
        {
        case "A" :
            a = enabled
            break
        case "A#\\Bb" :
            aB = enabled
            break
        case "B" :
            b = enabled
            break
        case "C" :
            c = enabled
            break
        case "C#\\Db" :
            cD = enabled
            break
        case "D" :
            d = enabled
            break
        case "D#\\Eb" :
            dE = enabled
            break
        case "E" :
            e = enabled
            break
        case "F" :
            f = enabled
            break
        case "F#\\Gb" :
            fG = enabled
            break
        case "G" :
            g = enabled
            break
        case "G#\\Ab" :
            gA = enabled
            break
        default:
            NSLog("Default hit, something is wrong")
            break
        }
    }
    
    func getNoteBool(note: String) -> BooleanLiteralType
    {
        switch(note)
        {
        case "A" :
            return a
        case "A#\\Bb" :
            return aB
        case "B" :
            return b
        case "C" :
            return c
        case "C#\\Db" :
            return cD
        case "D" :
            return d
        case "D#\\Eb" :
            return dE
        case "E" :
            return e
        case "F" :
            return f
        case "F#\\Gb" :
            return fG
        case "G" :
            return g
        case "G#\\Ab" :
            return gA
        default:
            NSLog("Default hit, something is wrong")
            return false
        }
    }
    
    func getNoteBool(note: Int) -> BooleanLiteralType
    {
        switch(note)
        {
        case 0 :
            return a
        case 1 :
            return aB
        case 2 :
            return b
        case 3 :
            return c
        case 4 :
            return cD
        case 5 :
            return d
        case 6 :
            return dE
        case 7 :
            return e
        case 8 :
            return f
        case 9 :
            return fG
        case 10 :
            return g
        case 11 :
            return gA
        default:
            NSLog("Default hit, something is wrong")
            return false
        }
    }
    
    func getNoteString(note: Int) -> String
    {
        switch(note)
        {
        case 0 :
            return "A"
        case 1 :
            return "Bb"
        case 2 :
            return "B"
        case 3 :
            return "C"
        case 4 :
            return "Db"
        case 5 :
            return "D"
        case 6 :
            return "Eb"
        case 7 :
            return "E"
        case 8 :
            return "F"
        case 9 :
            return "Gb"
        case 10 :
            return "G"
        case 11 :
            return "Ab"
        default:
            NSLog("Default hit, something is wrong")
            return ""
        }
    }
    
    func getNoteValue(note: String) -> Int
    {
        switch(note)
        {
        case "A" :
            return 0
        
        case "A#\\Bb":
            return 1
        case "Bb" :
            return 1
        
        case "B" :
            return 2
        
        case "C" :
            return 3
        
        case "C#\\Db":
            return 4
        case "Db" :
            return 4
        
        case "D" :
            return 5
        
        case "D#\\Eb":
            return 6
        case "Eb" :
            return 6
        
        case "E" :
            return 7
        
        case "F" :
            return 8
        
        case "F#\\Gb":
            return 9
        case "Gb" :
            return 9
        
        case "G" :
            return 10
        
        case "G#\\Ab":
            return 11
        case "Ab" :
            return 11
        default:
            NSLog("Default hit, something is wrong")
            return -1
        }
    }
    
}

class SetupViewController: UIViewController {
    
    let BUTTON_FONT1: CGFloat = 24.0
    let BUTTON_FONT2: CGFloat = 36.0
    let BUTTON_FONT3: CGFloat = 28.0
    
    var slider : twoKnobRangeSlider = twoKnobRangeSlider(frame: CGRectMake(50.0, 50.0, 100.0, 10.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let menu = menuButton.titleLabel
        {
            menu.font! = menu.font!.fontWithSize(BUTTON_FONT1)
            menu.sizeToFit()
        }
        if let begin = beginButton.titleLabel
        {
            begin.font! = begin.font!.fontWithSize(BUTTON_FONT1)
            begin.sizeToFit()
        }
        if let reset = resetButton.titleLabel
        {
            reset.font! = reset.font!.fontWithSize(BUTTON_FONT1)
            reset.sizeToFit()
        }
        
        if let reference = referenceButton.titleLabel
        {
            reference.font! = reference.font!.fontWithSize(BUTTON_FONT3)
            reference.sizeToFit()
        }
        if let replayNote = replayNoteButton.titleLabel
        {
            replayNote.font! = replayNote.font!.fontWithSize(BUTTON_FONT3)
            replayNote.sizeToFit()
        }
        if let octave = selectOctave.titleLabel
        {
            octave.font! = octave.font!.fontWithSize(BUTTON_FONT3)
            octave.sizeToFit()
        }
        
        menuButton.updateConstraints()
        beginButton.updateConstraints()
        resetButton.updateConstraints()
        
        referenceButton.updateConstraints()
        replayNoteButton.updateConstraints()
        selectOctave.updateConstraints()
        
        rangeTextLabel.text! = " "
        
        for noteButton in noteButtonCollection
        {
            if let note = noteButton.titleLabel
            {
                note.font! = note.font!.fontWithSize(BUTTON_FONT2)
                note.sizeToFit()
            }
            noteButton.updateConstraints()
        }
        
        slider = twoKnobRangeSlider( frame: CGRect( origin: CGPoint(x: rangeLabel.frame.origin.x + rangeLabel.frame.width, y: rangeLabel.frame.origin.y + (1.5 * rangeLabel.frame.height)), size: CGSize(width: self.view.frame.width - rangeLabel.frame.width - rangeLabel.frame.height, height: rangeLabel.frame.height) ) )
        
        self.view.addSubview(slider)
        
        slider.addTarget(self, action: "updateFromSlider:", forControlEvents: UIControlEvents.ValueChanged)
        
        defaultSettings()
        
        updateFromSlider(slider)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func updateFromSlider(s: twoKnobRangeSlider)
    {
        updateRange()
        noteData.sharedInstance.rangeLo = Int(s.getLower())
        noteData.sharedInstance.rangeHi = Int(s.getUpper())
    }
    
    func updateRange()
    {
        if let text = rangeTextLabel.text?
        {
            rangeTextLabel.text! = "Range from \(Int(slider.getLower())) to \(Int(slider.getUpper())) octaves"
        }
    }
    
    
    @IBAction func noteTapped(sender: UIButton) {
        
        for noteButton in noteButtonCollection
        {
            if sender.titleLabel?.text! == noteButton.titleLabel?.text!
            {
                noteButton.enabled = !noteButton.enabled
                if let text = noteButton.titleLabel?.text!
                {
                    noteData.sharedInstance.setNoteBool(text, enabled: noteButton.enabled)
                }
            }
        }
    }
    
    @IBAction func reset(sender: UIButton) {
        defaultSettings()
    }
    
    func defaultSettings()
    {
        for noteButton in noteButtonCollection
        {
            noteButton.enabled = true
            if let text = noteButton.titleLabel?.text!
            {
                noteData.sharedInstance.setNoteBool(text, enabled: noteButton.enabled)
            }
        }
        
        referenceButton.enabled = true
        noteData.sharedInstance.reference = true
        
        replayNoteButton.enabled = true
        noteData.sharedInstance.replayNote = true
        
        selectOctave.enabled = false
        noteData.sharedInstance.selectOctave = false
    }
    
    
    @IBAction func pickReference(sender: UIButton) {
        referenceButton.enabled = false
        noteData.sharedInstance.reference = false
    }
    
    
    @IBAction func pickReplayNote(sender: UIButton) {
        replayNoteButton.enabled = false
        noteData.sharedInstance.replayNote = false
    }
    
    @IBAction func pickSelectOctave(sender: UIButton) {
        selectOctave.enabled = false
        noteData.sharedInstance.reference = false
    }
    
    
    @IBOutlet var noteButtonCollection: [UIButton]!
    
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var rangeTextLabel: UILabel!
    
    @IBOutlet weak var referenceButton: UIButton!
    @IBOutlet weak var replayNoteButton: UIButton!
    @IBOutlet weak var selectOctave: UIButton!
    
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var beginButton: UIButton!
}
