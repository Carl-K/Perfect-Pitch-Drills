//
//  statsViewController.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 6/7/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class statsData
{
    var statsList = List()
    
    private init()
    {
        
    }
    
    class var sharedInstance : statsData
    {
        struct Static {
            static var instance : statsData?
        }
        
        if !(Static.instance != nil)
        {
            Static.instance = statsData();
        }
        
        return Static.instance!
    }
    
    func getList() -> List<NSObject>
    {
        return statsList
    }
}

class statsViewController: UIViewController {
    
    let BUTTON_FONT1: CGFloat = 24.0
    let BUTTON_FONT2: CGFloat = 36.0
    let BUTTON_FONT3: CGFloat = 28.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let back = backButton.titleLabel
        {
            back.font! = back.font!.fontWithSize(BUTTON_FONT1)
            back.sizeToFit()
        }
        if let credits = creditsButton.titleLabel
        {
            credits.font! = credits.font!.fontWithSize(BUTTON_FONT1)
            credits.sizeToFit()
        }
        
        backButton.updateConstraints()
        creditsButton.updateConstraints()
        
        updateStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateStats()
    {
        var percentCorrect = statsData.sharedInstance.statsList.percentTrue(10)
        lastTen.text = (percentCorrect != -1 ? "\(percentCorrect)% CORRECT" : "NOT AVAILABLE")
        percentCorrect = statsData.sharedInstance.statsList.percentTrue(50)
        lastFifty.text = (percentCorrect != -1 ? "\(percentCorrect)% CORRECT" : "NOT AVAILABLE")
        percentCorrect = statsData.sharedInstance.statsList.percentTrue(100)
        lastHundred.text = (percentCorrect != -1 ? "\(percentCorrect)% CORRECT" : "NOT AVAILABLE")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var creditsButton: UIButton!
    @IBOutlet weak var lastTen: UILabel!
    @IBOutlet weak var lastFifty: UILabel!
    @IBOutlet weak var lastHundred: UILabel!
}
