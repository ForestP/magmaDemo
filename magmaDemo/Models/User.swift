//
//  User.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/27/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import Foundation

struct User {
    let fullName: String
    let email: String
    let userName: String
    let pass: String
    var interests: [String]?
}

extension User {
    
    static func createUser(userData: [String: String]) -> User? {
        if let name = userData["Full Name"],
            let email = userData["Email"],
            let userName = userData["User Name"],
            let pass = userData["Password"] {
            
            return User(
                fullName: name,
                email: email,
                userName: userName,
                pass: pass,
                interests: nil
            )
            
        }
        return nil
    }
}
