//
//  CustomViewController.swift
//  MessagingApp
//
//  Created by Gordon Lei on 10/7/20.
//  Copyright © 2020 Gordon Lei. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CustomViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference();
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addPost(_ sender: Any) {
        //Post data to firebase
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        //dismis the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    
    }
    
    
    @IBAction func cancelPost(_ sender: Any) {
        //dismis the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
