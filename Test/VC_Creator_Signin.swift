//
//  ViewControllerHomePageCreator.swift
//  Test
//
//  Created by Jessica Vilaysak on 11/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit
import FirebaseAuth



class VC_Creator_Signin: UIViewController, UITextFieldDelegate {

    @IBOutlet var fld_password: UITextField!
    @IBOutlet var fld_username: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_Signin(_ sender: Any) {
        dataSource.username = fld_username.text;
        if let email = fld_username.text, let pass = fld_password.text
        {
            
                FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    
                    if user != nil{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    
                    }
                    else{
                        print(error!);
                        let alert = UIAlertController(title: "Login Failed", message: "Enter correct username or password", preferredStyle: UIAlertControllerStyle.alert);
                        let cancelAction = UIAlertAction(title: "OK",
                                                         style: .cancel, handler: nil)
                        alert.addAction(cancelAction)

                        self.present(alert,animated: true){
                            
                        }
                    }
                    
                    
                })
            
                
            }
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
