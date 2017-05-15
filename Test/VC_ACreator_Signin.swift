//
//  ViewControllerHome2.swift
//  Test
//
//  Created by Jessica Vilaysak on 10/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class VC_ACreator_Signin: UIViewController, UITextFieldDelegate {

    @IBOutlet var fldemail: UITextField!
    @IBOutlet var fldusername: UITextField!
    @IBOutlet var fldpassword: UITextField!
    
    @IBAction func btn_Signin(_ sender: Any) {
        dataSource.username = fldusername.text;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
