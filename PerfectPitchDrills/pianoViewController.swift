//
//  pianoViewController.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 6/7/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit
import AVFoundation

class pianoViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C4", ofType: "aiff")!), error: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pianoImage.image = UIImage(named: "piano.png")
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
    
    
    @IBAction func noteTouched(sender: UIButton) {
        
        if let text = sender.titleLabel?.text
        {
            audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(text + "4", ofType: "aiff")!), error: nil)
        }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @IBAction func aBTouched(sender: AnyObject) {
        
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Bb4", ofType: "aiff")!), error: nil)
        
    }
    
    @IBAction func cDTouched(sender: AnyObject) {
        
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Db4", ofType: "aiff")!), error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @IBAction func dETouched(sender: UIButton) {
        
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Eb4", ofType: "aiff")!), error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @IBAction func fGTouched(sender: UIButton) {
        
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Gb4", ofType: "aiff")!), error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    @IBAction func gATouched(sender: UIButton) {
        
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ab4", ofType: "aiff")!), error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    @IBOutlet weak var pianoImage: UIImageView!
}
