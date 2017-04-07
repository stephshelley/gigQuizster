//
//  OpeningView.swift
//  GigQuizSter
//
//  Created by Stephanie Volftsun on 4/4/17.
//  Copyright © 2017 Best Friend Labs, LLC. All rights reserved.
//

import Foundation
import UIKit

class OpeningView: UIView {
    
    var whiteLogoBig: UIImageView!
    var colorLogoBig: UIImageView!
    var topImage: UIImageView!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.initUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animate(onCompletion: @escaping(()->())) {
        UIView.animate(withDuration: 1.3, animations: {
            self.whiteLogoBig.alpha = 0
            self.colorLogoBig.alpha = 1
            self.backgroundColor = UIColor.white;
            self.topImage.alpha = 0;
        }) { (blah) in
            print("Done with Step 1")
            self.colorLogoBig.snp.makeConstraints({ (make) in
                make.height.equalTo(50)
                make.width.equalTo(57)
                make.top.equalTo(55)
            })
            UIView.animate(withDuration: 1.3, animations: {
                self.layoutIfNeeded()
            }, completion: { (blah) in
                print("Done with Step 2")
                onCompletion()

            })
        }
    }
    
    func initUI() {
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background_pattern.png")!)
        
        // Top background image
        let homepage_image = UIImage(named: "homepage_image.png");
        topImage = UIImageView(image: homepage_image);
        topImage.contentMode = UIViewContentMode.center;
        self.addSubview(topImage);
        topImage.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self)
            make.height.equalTo(398)
        };
        
        // Top White Logo
        whiteLogoBig = UIImageView(image: UIImage(named: "White_Logo_Big.png"));
        self .addSubview(whiteLogoBig);
        whiteLogoBig.snp.makeConstraints { (make) in
            make.width.equalTo(187)
            make.height.equalTo(167)
            make.centerX.equalTo(self)
            make.top.equalTo(116)
        }
        
        // Top Color Logo (starts transparent)
        colorLogoBig = UIImageView(image: UIImage(named: "color-logo-big.png"));
        self .addSubview(colorLogoBig);
        colorLogoBig.alpha = 0;
        colorLogoBig.snp.makeConstraints { (make) in
            make.width.equalTo(187)
            make.height.equalTo(167)
            make.centerX.equalTo(self)
            make.top.equalTo(116)
        }
        
        
        // Title Label "#GIG[QUIZ]STER
        let titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Colfax-Bold", size: 30)
        titleLabel.text = "#GIG[QUIZ]STER"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(36)
            make.top.equalTo(469)
            make.centerX.equalTo(self)
        }
        
        // Subtitle label "Can you Mental Math?"
        let subLabel = UILabel()
        self.addSubview(subLabel)
        subLabel.font = UIFont(name: "Colfax-Regular", size: 18)
        subLabel.text = "Can you Mental Math?"
        subLabel.textAlignment = NSTextAlignment.center
        subLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(21)
            make.top.equalTo(505)
            make.centerX.equalTo(self)
        }
        
    }
    
    
}
