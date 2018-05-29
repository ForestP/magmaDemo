//
//  UITableView+Ext.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/27/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_:T.Type) where T: ReusableView, T: NibLoadableView {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier) ")
        }
        return cell
    }
    
}

extension UITableViewCell: ReusableView {}

