//
//  QuizView.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/4/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//

import Foundation
import UIKit
import UIColor_Hex_Swift

class QuizView: UIView {
    var problemLabel: UILabel!
    var buttonsView: TrueFalseButtons!
    
    var mathProblem: MathProblem? {
        didSet {
            updateUI();
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        guard let mathProblem = mathProblem else {
            return
        }
        
        problemLabel.text = mathProblem.text
        buttonsView.reset()
        
    }
    
    func initUI() {
        
        // Top Color Logo
        let logo = UIImageView(image: UIImage(named: "color-logo-big.png"));
        self .addSubview(logo);
        logo.snp.makeConstraints { (make) in
            make.width.equalTo(57)
            make.height.equalTo(50)
            make.centerX.equalTo(self)
            make.top.equalTo(55)
        }
        
        // True False Buttons -- made with .xib
        buttonsView = TrueFalseButtons()
        self.addSubview(buttonsView)
        buttonsView.backgroundColor = UIColor.yellow
        buttonsView.snp.makeConstraints { (make) in
            make.width.equalTo(257)
            make.height.equalTo(151)
            make.centerX.equalTo(self)
            make.bottomMargin.equalTo(-55)
        }
        
        // Button actions
        buttonsView.trueButton.didTouchUpInside = {(sender) in
            self.checkAnswer(answer: true)
        }
        
        buttonsView.falseButton.didTouchUpInside = {(sender) in
            self.checkAnswer(answer: false)
        }
        
        
        // Math Problem
        problemLabel = UILabel()
        problemLabel.font = UIFont(name: "Colfax-Regular", size: 40)
        problemLabel.text = "1+1=248"
        problemLabel.textAlignment = NSTextAlignment.center
        self.addSubview(problemLabel)
        problemLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logo.snp.bottom)
            make.bottom.equalTo(buttonsView.snp.top)
            make.right.equalTo(self).offset(-40);
            make.left.equalTo(self).offset(40)
            
        }
        
        self.mathProblem = MathProblem.create()
    }
    
    // Should go in controller
    func checkAnswer(answer: Bool) {
        
        // They were correct
        if(answer == mathProblem?.isTrue) {
            answer ? buttonsView.trueIsCorrect(isCorrect: true) : buttonsView.falseIsCorrect(isCorrect: true)
        } else {
            !answer ? buttonsView.falseIsCorrect(isCorrect: false) : buttonsView.trueIsCorrect(isCorrect: false)
            
        }
        
        // Load next problem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.mathProblem = MathProblem.create();
        })
        
    }
}

