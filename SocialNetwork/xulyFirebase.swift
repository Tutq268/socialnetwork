//
//  xulyFirebase.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/8/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import UIKit
import FirebaseAuth
    func registerWithEmail(email: String,password: String, completion: @escaping (_ uid:FIRUser?,_ error:String?)->())
    {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {
        (user, error) in
            if error == nil
            {
            print("Dang Nhap Thanh Cong")
                completion(user,error?.localizedDescription)
            }
            else{
               
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {
                    (users, error) in
                    if error != nil
                    {
                        completion(users,error?.localizedDescription)
                    }
                    else {
                        users?.sendEmailVerification(completion: {
                            (error) in
                        })
                        completion(users,"moi ban check mail")
                    }
                })
            }
        })
    }
