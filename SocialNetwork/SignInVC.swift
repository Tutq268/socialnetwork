//
//  ViewController.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/7/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper
class SignInVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.isSecureTextEntry = true
    }
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID)
        {
            performSegue(withIdentifier: "seque", sender: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func abtnLoginFB(_ sender: UIButton) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler: {
        (user, error) in
            if error != nil {
            print("Tu Tran!: unable to authentication with facebook\(error)")
            }
            else if (user?.isCancelled)!{
            print("Tu Tran!: User canceled facebook auth")
            }
            else{
            print("Tu Tran: Successfully auth with facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        })
    }
    func firebaseAuth(_ credential: FIRAuthCredential)
    {
        FIRAuth.auth()?.signIn(with: credential, completion: {
        (user, error) in
            if error != nil
            {
            print("Tu Tran: Unable to authentication with Firebase- \(error)")
            }
            else
            {
            print("Tu Tran: Successfully authenticated with firebase")
                if let user = user
                {
                    let userData = ["provider": credential.provider]
                 self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        })
    }
    @IBAction func abtnLoginEmail(_ sender: UIButton) {
        registerWithEmail(email: txtEmail.text!, password: txtPassword.text!, completion: {
        (users, error) in
            if let user = users{
                let userData = ["provider": users?.providerID]
                self.completeSignIn(id: user.uid, userData: userData as! Dictionary<String, String>)
            }
        })
    }
    func completeSignIn(id: String, userData: Dictionary<String,String>){
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        KeychainWrapper.standard.set(id, forKey: KEY_UID)
        performSegue(withIdentifier: "seque", sender: nil)

    }
}

