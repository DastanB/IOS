//
//  ViewController.swift
//  calculator
//
//  Created by Сейткасым Байтурсынов on 9/5/19.
//  Copyright © 2019 Сейткасым Байтурсынов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var numberOnLabel:Double = 0;
    var previousNumber:Double = 0;
    var calculate:Bool = false;
    var operation:Double = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if calculate == true
        {
            label.text = String(sender.tag-1)
            numberOnLabel = Double(label.text!)!
            calculate = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnLabel = Double(label.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12
            {
                label.text = "/"
            }
            else if sender.tag == 13
            {
                label.text = "x"
            }
            else if sender.tag == 14
            {
                label.text = "-"
            }
            else if sender.tag == 15
            {
                label.text = "+"
            }
            operation = Double(sender.tag)
            calculate = true;
            
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnLabel)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnLabel)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnLabel)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnLabel)
            }
        }
        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0;
            numberOnLabel = 0;
            operation = 0;
            calculate = false;
        }
    }
}

