//
//  TrueFalseButtons.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/4/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//

import Foundation
import UIKit

class TrueFalseButtons: UIView {
    @IBOutlet weak var topIcon: RightWrongIcon!
    @IBOutlet weak var bottomIcon: RightWrongIcon!
    @IBOutlet weak var trueButton: Button!
    @IBOutlet weak var falseButton: Button!
    
    
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func reset() {
        topIcon.isHidden = true
        bottomIcon.isHidden = true
    }
    
    func trueIsCorrect(isCorrect: Bool) {
        topIcon.image = UIImage(named: (isCorrect ? "right-icon.png" : "wrong-icon.png"));
        topIcon.isHidden = false;
        bottomIcon.isHidden = true;
    }
    
    func falseIsCorrect(isCorrect: Bool) {
        bottomIcon.image = UIImage(named: (isCorrect ? "right-icon.png" : "wrong-icon.png"));
        bottomIcon.isHidden = false;
        topIcon.isHidden = true;
    }
    
    
    // Set up the view
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        addSubview(view)
        
        self.reset()
    }
    
    
    // Load the nib
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
