//
//  FeedVC.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/8/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func abtnLogout(_ sender: UIButton) {
      let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Signout successfully \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)
    }
    
}
