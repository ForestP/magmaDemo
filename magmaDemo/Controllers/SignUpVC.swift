//
//  ViewController.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/27/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btnBottom: NSLayoutConstraint!
    
    var fieldData: [[String:String]]?
    var activeField: UITextField?
    
    let interestSegue = "goToInterests"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnView.isHidden = true
        
        // Setup Tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(headerCell.self)
        tableView.register(fieldCell.self)
        
        // Keyboard monitoring
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
 
        
        // Setup Fields
        let su = SignUpService.instance
        self.fieldData = su.createFields()
        
        self.tableView.reloadData()
    }

    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
           
            let viewH = keyboardSize.height
            if btnView.isHidden {
                self.btnView.isHidden = false
                self.btnBottom.constant = viewH + 8
            }
        }
    }
    
    func createUser(onComplete: Completion?) {
        guard let fields = self.fieldData else { return }
        var userData = [String:String]()
        for i in 0...fields.count-1 {
            let path = IndexPath(row: i, section: 1)
            guard let cell = self.tableView.cellForRow(at: path) as? fieldCell else { return }
            if let fieldData = cell.fieldInput.text, fieldData != "",
                let fieldName = fields[i]["fieldName"] {
                userData[fieldName] = fieldData
            }
        }
        let us = UserService.instance
        us.createUser(data: userData) { (err, data) in
            if err != nil {
                // handle err
                onComplete?(err, nil)
            } else {
                onComplete?(nil, "success" as AnyObject)
            }
        }
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        self.createUser { (err, data) in
            if err == nil {
                self.performSegue(withIdentifier: self.interestSegue, sender: nil)
            } else {
                // handle err
            }
        }
    }
    
}

extension SignUpVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            guard self.fieldData != nil else { return 0 }
            return self.fieldData!.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as headerCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as fieldCell
            
            guard self.fieldData != nil else { return cell }
            let cellData = self.fieldData![indexPath.row]
            if let fieldName = cellData["fieldName"],
                let placeHolder = cellData["placeholder"] {
                cell.configureCell(fieldName: fieldName, placeHolder: placeHolder)
            }
        
            return cell
        }
    }
    
    
    
}
