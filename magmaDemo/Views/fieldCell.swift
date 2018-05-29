//
//  fieldCell.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/27/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

class fieldCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var fieldNameLbl: UILabel!
    @IBOutlet weak var fieldInput: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(fieldName: String, placeHolder: String) {
        self.fieldNameLbl.text = fieldName
        self.fieldInput.placeholder = placeHolder
    }
    
}
