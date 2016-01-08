//
//  ViewController.swift
//  TipCalculator
//
//  Created by Richie Gurgul on 9/24/15.
//  Copyright (c) 2015 Richie Gurgul. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var subtotalText: UITextField!
    @IBOutlet weak var tipText: UITextField!
    @IBOutlet weak var totalText: UITextField!
    @IBOutlet weak var peopleToSplit: UITextField!
    @IBOutlet weak var moneyToSplit: UITextField!
    
    @IBOutlet weak var buttonTen: UIButton!
    @IBOutlet weak var buttonFifteen: UIButton!
    @IBOutlet weak var buttonTwenty: UIButton!
    @IBOutlet weak var buttonTwentyFive: UIButton!
    @IBOutlet weak var backgroundFade: UIImageView!

    var patrons = 1.0
    var subtotal = 0.0
    var tip = 0.0
    var total = 0.0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func tenTap(sender: AnyObject)
    {
        subtotal = (subtotalText.text as NSString).doubleValue
        
        var myBill = calcTip(0.10, amount: subtotal)
        tipText.text = "$" + String(format: "%.2f", myBill.0)
        totalText.text = "$" + String(format: "%.2f", myBill.1)
        
        resetButtons()
        buttonTen.setImage(UIImage(named: "10_selected_image"), forState: UIControlState.Normal)
    }
    
    @IBAction func fifteenTap(sender: AnyObject)
    {
        subtotal = (subtotalText.text as NSString).doubleValue
        
        var myBill = calcTip(0.15, amount: subtotal)
        tipText.text = "$" + String(format: "%.2f", myBill.0)
        totalText.text = "$" + String(format: "%.2f", myBill.1)
        
        resetButtons()
        buttonFifteen.setImage(UIImage(named: "15_selected_image"), forState: UIControlState.Normal)
    }
    
    @IBAction func twentyTap(sender: AnyObject)
    {
        subtotal = (subtotalText.text as NSString).doubleValue
        
        var myBill = calcTip(0.20, amount: subtotal)
        tipText.text = "$" + String(format: "%.2f", myBill.0)
        totalText.text = "$" + String(format: "%.2f", myBill.1)
        
        resetButtons()
        buttonTwenty.setImage(UIImage(named: "20_selected_image"), forState: UIControlState.Normal)
    }
    
    @IBAction func twentyFiveTap(sender: AnyObject)
    {
        subtotal = (subtotalText.text as NSString).doubleValue
        
        var myBill = calcTip(0.25, amount: subtotal)
        tipText.text = "$" + String(format: "%.2f", myBill.0)
        totalText.text = "$" + String(format: "%.2f", myBill.1)
        
        resetButtons()
        buttonTwentyFive.setImage(UIImage(named: "25_selected_image"), forState: UIControlState.Normal)
    }
    
    func resetButtons()
    {
        buttonTen.setImage(UIImage(named: "10_unselected_image"), forState: UIControlState.Normal)
        buttonFifteen.setImage(UIImage(named: "15_unselected_image"), forState: UIControlState.Normal)
        buttonTwenty.setImage(UIImage(named: "20_unselected_image"), forState: UIControlState.Normal)
        buttonTwentyFive.setImage(UIImage(named: "25_unselected_image"), forState: UIControlState.Normal)
    }
    
    func calcTip(percent: Double, amount: Double) -> (Double, Double)
    {
        tip = amount * percent
        total = amount * (percent + 1)
        return(tip, total)
    }
    
    @IBAction func morePeople(sender: AnyObject)
    {
        ++patrons
        peopleToSplit.text = String(format: "%.0f", patrons) + " People"
        var moneySplit = total / patrons
        moneyToSplit.text = "$" + String(format: "%.2f", moneySplit)
    }
    
    @IBAction func lessPeople(sender: AnyObject)
    {
        --patrons
        if(patrons < 1)
        {
            patrons = 1
        }
        if(patrons > 1)
        {
            peopleToSplit.text = String(format: "%.0f", patrons) + " People"
        }
        else
        {
            peopleToSplit.text = "1 Person"
        }
        var moneySplit = total / patrons
        moneyToSplit.text = "$" + String(format: "%.2f", moneySplit)
    }
    
}