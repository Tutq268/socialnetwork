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
    static var ds = DataService()
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    var REF_BASE:FIRDatabaseReference {
    return _REF_BASE
    }
    var REF_POSTS:FIRDatabaseReference {
    return _REF_POSTS
    }
    var REF_USERS:FIRDatabaseReference{
    return _REF_USERS
    }
    func CreateDatabaseBDUser(uid:String, dataService:Dictionary<String,String>)
    {
    REF_USERS.child(uid).updateChildValues(dataService)
    }
}
