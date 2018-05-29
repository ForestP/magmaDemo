//
//  InterestsVC.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/28/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

class InterestsVC: UIViewController {

    @IBOutlet weak var btn_1: interestBtnView!
    @IBOutlet weak var btn_2: interestBtnView!
    @IBOutlet weak var btn_3: interestBtnView!
    @IBOutlet weak var btn_4: interestBtnView!
    @IBOutlet weak var btn_5: interestBtnView!
    @IBOutlet weak var btn_6: interestBtnView!
    @IBOutlet weak var btn_7: interestBtnView!
    @IBOutlet weak var btn_8: interestBtnView!
    @IBOutlet weak var btn_9: interestBtnView!
    @IBOutlet weak var btn_10: interestBtnView!
    @IBOutlet weak var btn_11: interestBtnView!
    @IBOutlet weak var btn_12: interestBtnView!
    @IBOutlet weak var btn_13: interestBtnView!
    @IBOutlet weak var btn_14: interestBtnView!
    
    
    var btns: [interestBtnView]!
    
    let finishSegue = "goToFinish"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.btns = [btn_1,btn_2,btn_3,btn_4,btn_5,btn_6,btn_7,btn_8,btn_9,btn_10,btn_11,btn_12,btn_13,btn_14]
        
    }

    func addInterests(onComplete: Completion?) {
        var interests = [String]()
        for btn in self.btns {
            if btn.state == "selected" {
                guard btn.name != nil else { return }
                interests.append(btn.name!)
            }
        }
        if interests.count != 0 {
            let us = UserService.instance
            us.addInterests(interests: interests, onComplete: { (err, data) in
                if err != nil {
                    onComplete?(err, nil)
                } else {
                    onComplete?(nil, "success" as AnyObject)
                }
            })
        }
    }

    @IBAction func doneBtnPressed(_ sender: Any) {
        self.addInterests { (err, data) in
            if err == nil {
                self.performSegue(withIdentifier: self.finishSegue, sender: nil)
            } else {
                // handle error
            }
        }
    }
    
}
