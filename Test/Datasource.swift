//
//  Datasource.swift
//  Test
//
//  Created by Jessica Vilaysak on 10/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class Datasource {

    var name: String!
    var userArray : [String] = ["temp_user_00", "temp_user_01", "temp_user_02"]
    var currentCount: Int!
    var postsobj : [(image: UIImage, caption: String)] = [(image: UIImage(named: "1")!, caption: "What a beautiful day"),
        (image: UIImage(named: "2")!, caption: "What a total uggo"),
        (image: UIImage(named: "3")!, caption: "I love this!!")
     ]
    //var postsobj : [(image: UIImage, caption: String)] = []
    var tempPosts : [String] = ["1", "2", "3", "4"]
    var postNotifications: Int!;

    init() {
        self.name = "TESTName"
        currentCount = 3
        postNotifications = 0;
    }
    
  
}
let dataSource = Datasource()

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
