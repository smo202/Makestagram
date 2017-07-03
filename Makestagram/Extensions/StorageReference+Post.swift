//
//  StorageReference+Post.swift
//  Makestagram
//
//  Created by Jerry Lu on 7/3/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import Foundation
import FirebaseStorage

extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = User.current.uid
        let timeStamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timeStamp).jpg")
    }
}
