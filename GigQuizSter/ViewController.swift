//
//  ViewController.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/3/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var openingView: OpeningView!
    var quizView: QuizView!
    
    override func loadView() {
        super.loadView()
        
        // Set up opening view
        openingView = OpeningView.init(frame: self.view.frame)
        self.view.addSubview(openingView)
        
        // Set up quiz view
        quizView = QuizView.init(frame: self.view.frame)
        quizView.alpha = 0;
        self.view.addSubview(quizView)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        openingView.animate() {
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.openingView.alpha = 0
                self.quizView.alpha = 1;
            }, completion: { (didComplete) in
                
            })
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

