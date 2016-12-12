//
//  DataService.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/12/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let DB_BASE = FIRDatabase.database().reference()
class DataService{
  static let ds = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REEF_BASE: FIRDatabaseReference{
    return _REF_BASE
    }
    var REF_POSTS: FIRDatabaseReference
        {
    return _REF_POSTS
    }
    var REF_USER:FIRDatabaseReference{
    return _REF_USERS
    }
    func createFirebaseDBUser(uid: String, userData: Dictionary<String,String>){
      REF_USER.child(uid).updateChildValues(userData)
    }
}
