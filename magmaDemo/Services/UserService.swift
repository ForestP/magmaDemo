//
//  UserService.swift
//  magmaDemo
//
//  Created by Forest Plasencia on 5/27/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import Foundation

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class UserService {
    private static let _instance = UserService()
    
    static var instance: UserService {
        return _instance
    }
    
    var currentUser: User?
    
    func createUser(data: [String:String], onComplete: Completion?) {
        if let newUser = User.createUser(userData: data) {
            self.currentUser = newUser
            onComplete?(nil, "success in creating user" as AnyObject)
        } else {
            onComplete?("err", nil)
        }
    }
    
    func addInterests(interests: [String], onComplete: Completion?) {
        guard self.currentUser != nil else { onComplete?("err",nil); return }
        self.currentUser!.interests = interests
        onComplete?(nil, "success in adding users" as AnyObject)
    }
    
    
}
