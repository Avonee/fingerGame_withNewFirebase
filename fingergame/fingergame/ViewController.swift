//
//  ViewController.swift
//  fingergame
//
//  Created by rubl333 on 2016/5/30.
//  Copyright © 2016年 appcoda. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    

    @IBOutlet weak var text: UITextField!
    
    @IBAction func add(sender: AnyObject) {
    
        FIRDatabase.database().reference().child("score").setValue(["uid": userID.text!,"firstScore": text.text!])
        
print("yaya")
        
    }
    @IBOutlet weak var userID: UITextField!
    @IBAction func Update(sender: AnyObject) {

        
        
        let key = FIRDatabase.database().reference().child("score").childByAutoId().key
        let post = ["uid": userID.text!,
                    "firstScore": text.text!]
        let childUpdates = ["/score/\(key)": post,
                            "/user-score/\(userID.text!)/\(key)/": post]
        
        FIRDatabase.database().reference().updateChildValues(childUpdates)
    }
    @IBAction func remove(sender: AnyObject) {
//        FIRDatabase.database().reference().child("score").setValue(["uid": userID.text!,"firstScore": text.text!])
        FIRDatabase.database().reference().child("score").removeValue()
        
        print("yaya")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
      
        
       
        
//        let storage = FIRStorage.storage()
//        let storageRef = storage.referenceForURL("gs://project-3808198048726923401.appspot.com")
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

