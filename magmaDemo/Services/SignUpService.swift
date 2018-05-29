//
//  SignUpService.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/28/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import Foundation

class SignUpService {
    private static let _instance = SignUpService()
    
    static var instance: SignUpService {
        return _instance
    }
    
    func createFields() -> [[String:String]] {
        return [
            newField(fieldName: "Full Name", placeholder: "John Smith"),
            newField(fieldName: "Email", placeholder: "John@magma.com"),
            newField(fieldName: "User Name", placeholder: "JohnSmith"),
            newField(fieldName: "Password", placeholder: "********")
        ]
    }
    
    private func newField(fieldName: String, placeholder: String) -> [String: String] {
        return [
            "fieldName" : fieldName,
            "placeholder" : placeholder
        ]
    }
    
}
