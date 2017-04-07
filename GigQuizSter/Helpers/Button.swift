//
//  Button.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/6/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//


import UIKit

class Button: UIButton {
    
    typealias DidTapButton = (Button) -> ()
    
    var didTouchUpInside: DidTapButton? {
        didSet {
            if didTouchUpInside != nil {
                addTarget(self, action: #selector(self.didTouchUpInsideAction), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(self.didTouchUpInsideAction), for: .touchUpInside)
            }
        }
    }
    
    // MARK: - Actions
    
    func didTouchUpInsideAction(sender: UIButton) {
        if let handler = didTouchUpInside {
            handler(self)
        }
    }
    
}

