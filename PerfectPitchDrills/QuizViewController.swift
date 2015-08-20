//
//  QuizViewController.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 6/3/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    let BUTTON_FONT1: CGFloat = 24.0
    let BUTTON_FONT2: CGFloat = 36.0
    
    let cAudioPlayer : AVAudioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C4", ofType: "aiff")!), error: nil)
    
    var audioPlayer : AVAudioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C4", ofType: "aiff")!), error: nil)
    
    var audioNoteString : String = ""
    var audioOctaveString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let back = backButton.titleLabel
        {
            back.font! = back.font!.fontWithSize(BUTTON_FONT1)
            back.sizeToFit()
        }
        if let replay = replayButton.titleLabel
        {
            replay.font! = replay.font!.fontWithSize(BUTTON_FONT1)
            replay.sizeToFit()
        }
        if let reference = referenceButton.titleLabel
        {
            reference.font! = reference.font!.fontWithSize(BUTTON_FONT1)
            reference.sizeToFit()
        }
        
        backButton.updateConstraints()
        replayButton.updateConstraints()
        referenceButton.updateConstraints()
        
        for noteButton in noteButtonCollection
        {
            if let note = noteButton.titleLabel
            {
                note.font! = note.font!.fontWithSize(BUTTON_FONT2)
                note.sizeToFit()
            }
            noteButton.updateConstraints()
        }
        
        correctnessLabel.text = ""
        
        setUp()
        
        cAudioPlayer.prepareToPlay()
        
        createAndPlayNewNote()
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
    
    func setUp()
    {
        for noteButton in noteButtonCollection
        {
            if let text = noteButton.titleLabel?.text!
            {
                noteButton.enabled = noteData.sharedInstance.getNoteBool(text)
            }
        }
        
        referenceButton.enabled = noteData.sharedInstance.reference
        replayButton.enabled = noteData.sharedInstance.replayNote
    }
    
    func generateRandomAudioNoteString() -> String
    {
        var noteNum = -1
        do {
            noteNum = Int(arc4random_uniform(12))
        } while (!noteData.sharedInstance.getNoteBool(noteNum))
        
        return noteData.sharedInstance.getNoteString(noteNum)
    }
    
    func generateRandomAudioOctaveString() -> String
    {
        return String((Int(arc4random())%(noteData.sharedInstance.rangeHi - noteData.sharedInstance.rangeLo)) + noteData.sharedInstance.rangeLo)
    }
    
    func playNote()
    {
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(audioNoteString + audioOctaveString, ofType: "aiff")!), error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func createAndPlayNewNote()
    {
        audioNoteString = generateRandomAudioNoteString()
        audioOctaveString = generateRandomAudioOctaveString()
        playNote()
        //NSLog( audioNoteString + audioOctaveString )
    }
    
    
    @IBAction func noteTouched(sender: UIButton) {
        if let text = sender.titleLabel?.text
        {
            if noteData.sharedInstance.getNoteValue(audioNoteString) == noteData.sharedInstance.getNoteValue(text)
            {
                correctnessLabel.text = "CORRECT"
                if (statsData.sharedInstance.getList().count == 100)
                {
                    statsData.sharedInstance.getList().dequeueFromBottom()
                }
                statsData.sharedInstance.getList().enqueueToTop(true)
            }
            else
            {
                correctnessLabel.text = "INCORRECT, IT WAS \(audioNoteString)\(audioOctaveString)"
                if (statsData.sharedInstance.getList().count == 100)
                {
                    statsData.sharedInstance.getList().dequeueFromBottom()
                }
                statsData.sharedInstance.getList().enqueueToTop(false)
            }
        }
        createAndPlayNewNote()
    }
    
    
    @IBAction func replayTouched(sender: UIButton) {
        audioPlayer.play()
    }
    
    
    @IBAction func referenceTouched(sender: UIButton) {
        cAudioPlayer.play()
    }
    
    
    @IBOutlet var noteButtonCollection: [UIButton]!
    
    @IBOutlet weak var replayButton: UIButton!
    @IBOutlet weak var referenceButton: UIButton!
    
    
    @IBOutlet weak var correctnessLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
}
