//
//  User.swift
//  Makestagram
//
//  Created by Jerry Lu on 6/29/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: NSObject {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
        super.init()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else {
                return nil
        }
        self.uid = uid
        self.username = username
        
        super.init()
    }
    
    private static var _current: User?
    
    // 2
    static var current: User {
        // 3
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentUser
    }
    
    // MARK: - Class Methods
    
    // 5
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
    }
}

extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
    }
}


