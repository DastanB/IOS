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

    var calculator = Calculator();
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if calculator.calculate == true
        {
            label.text = String(sender.tag-1)
            calculator.numberOnLabel = Double(label.text!)!
            calculator.calculate = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            calculator.numberOnLabel = Double(label.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            calculator.previousNumber = Double(label.text!)!
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
            calculator.operation = Double(sender.tag)
            calculator.calculate = true;
            
        }
        else if sender.tag == 16
        {
            label.text = calculator.eval();
        }
        else if sender.tag == 11{
            label.text = ""
            calculator.clear();
        }
    }
}

