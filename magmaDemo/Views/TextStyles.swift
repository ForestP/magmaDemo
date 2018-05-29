//
//  TextStyles.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/27/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import Foundation
import UIKit


// Allows creating of class with font in bold, medium, etc
extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semiBold: UIFont { return withWeight(.semibold) }
    var medium: UIFont { return withWeight(.medium) }
    
    
    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]
        
        traits[.weight] = weight
        
        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName
        
        let descriptor = UIFontDescriptor(fontAttributes: attributes)
        
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}


// Styles

class header: UILabel {
    override func layoutSubviews() {
        self.font = UIFont(name: "SF Pro Text", size: CGFloat(24.0))?.medium
        self.textColor = MAIN_BLACK
    }
}

class subHeader: UILabel {
    override func layoutSubviews() {
        self.font = UIFont(name: "SF Pro Text", size: CGFloat(14.0))
        self.textColor = MAIN_ORANGE
    }
}
