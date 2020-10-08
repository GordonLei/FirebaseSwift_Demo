//
//  ViewController.swift
//  MessagingApp
//
//  Created by Gordon Lei on 10/2/20.
//  Copyright © 2020 Gordon Lei. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var ref:DatabaseReference?

    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]();
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference();
        
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            //code executed when child added
            //take value from snapshot and add to postData
            
            //try to covnert value of the data to a string
            let post = snapshot.value as? String
            //
            if let actualPost = post {
                //append data to postData
                self.postData.append(actualPost)
                //reload tableview
                self.tableView.reloadData();
            }
            
            
        })
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell");
        
        cell?.textLabel?.text = postData[indexPath.row];
        
        return cell!
    }


}

