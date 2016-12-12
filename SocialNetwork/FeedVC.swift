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

    @IBOutlet weak var tableFeed: UITableView!
    @IBOutlet weak var txtCaption: UITextField!
    @IBOutlet weak var btnSelectImg: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableFeed.delegate = self
        tableFeed.dataSource = self
    }
    
    @IBAction func abtnLogout(_ sender: UIButton) {
      let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Signout successfully \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func abtnSelectImg(_ sender: UIButton) {
        
    }
    @IBAction func abtnPushStt(_ sender: UIButton) {
    }
}
extension FeedVC: UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableFeed.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellFeed
        {
        return cell
        }
        return UITableViewCell()
    }
}
