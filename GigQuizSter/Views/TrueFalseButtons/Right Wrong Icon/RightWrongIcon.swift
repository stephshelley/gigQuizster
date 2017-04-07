//  A simple icon that can be set to wrong or right.
//  RightWrongIcon.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/4/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//

import Foundation
import UIKit

class RightWrongIcon: UIImageView {
    
    func setRight(isRight: Bool) {
        if(isRight) {
            self.image = UIImage(named: "right-icon.png")
        } else {
            self.image = UIImage(named: "wrong-icon.png")
        }
        self.setVisible(isVisible: true)
    }
    
    func setVisible(isVisible: Bool) {
        self.isHidden = !isVisible;
    }
    
    static func recommendedHeight() -> CGSize {
        return CGSize(width: 22, height: 22)
    }
}
