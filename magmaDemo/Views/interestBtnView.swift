//
//  interestBtnView.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/29/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

class interestBtnView: UIView {

    @IBOutlet weak var textLbl: UILabel!

    var state = "unselected"
    var name: String?
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 4.0
        self.layer.borderWidth = 1.0
        self.textLbl.font = UIFont(name: "SF Pro Text", size: CGFloat(14.0))
        self.name = self.textLbl.text
        setLayoutForState()
    }

    func setLayoutForState() {
        if state == "unselected" {
            self.layer.borderColor = SECONDARY_GREY.cgColor
            self.textLbl.textColor = SECONDARY_GREY
            self.layer.opacity = 0.73
        } else if state == "selected" {
            self.layer.borderColor = MAIN_ORANGE.cgColor
            self.textLbl.textColor = MAIN_ORANGE
            self.layer.opacity = 1.0
        }
    }
    
    func changeState() {
        if state == "selected" {
            self.state = "unselected"
        } else if state == "unselected" {
            self.state = "selected"
        }
        self.setLayoutForState()
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        self.changeState()
    }
}

