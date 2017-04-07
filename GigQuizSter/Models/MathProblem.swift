//
//  MathProblem.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/4/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//

import Foundation



class MathProblem: NSObject {
    var text: String!
    var isTrue: Bool!
    

    
    
    // MARK: Static Methods
    
    static func create() -> MathProblem{
        
        var problemTypes = ["+", "-"];
        var answerTypes = [false,true];
        
        
        var randomIndex = Int(arc4random_uniform(UInt32(problemTypes.count)))
        let type = problemTypes[randomIndex]
        
        randomIndex = Int(arc4random_uniform(UInt32(answerTypes.count)))
        let isCorrect = answerTypes[randomIndex]
        
        let num1 = Int(arc4random_uniform(100))
        let num2 = Int(arc4random_uniform(100))
        var answer: Int;

        let mathProblem = MathProblem();
        
        switch type {

        case "+": // Add
            if(isCorrect) {
                answer = num1+num2
            } else {
                answer = Int(arc4random_uniform(100))
            }
            
            mathProblem.text = "\(num1)+\(num2)=\(answer)"
            mathProblem.isTrue = isCorrect
            break
            
        case "-": // Subtract
            if(isCorrect) {
                answer = num1-num2;
            } else {
                answer = Int(arc4random_uniform(100))
            }
            
            mathProblem.text = "\(num1)-\(num2)=\(answer)"
            mathProblem.isTrue = isCorrect
            break
            
        default:
            break
        }
        
        return mathProblem
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}
