//
//  Calculator.swift
//  calculator
//
//  Created by Gera on 18/09/2019.
//  Copyright © 2019 Сейткасым Байтурсынов. All rights reserved.
//

import Foundation

class Calculator {
    var numberOnLabel: Double = 0;
    var previousNumber: Double = 0;
    var calculate: Bool = false;
    var operation: Double = 0;
    
    
    public func clear(){
        self.numberOnLabel = 0;
        self.previousNumber = 0;
        self.calculate = false;
        self.operation = 0;
    }
    
    public func eval() -> String{
        var label: String = "";
        if self.operation == 12
        {
            label = String(self.previousNumber / self.numberOnLabel)
        }
        else if self.operation == 13
        {
            label = String(self.previousNumber * self.numberOnLabel)
        }
        else if self.operation == 14
        {
            label = String(self.previousNumber - self.numberOnLabel)
        }
        else if self.operation == 15
        {
            label = String(self.previousNumber + self.numberOnLabel)
        }
        
        return label;
    }
}
