//
//  ViewControllerHomePageCreator.swift
//  Test
//
//  Created by Jessica Vilaysak on 11/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD
import SwiftKeychainWrapper

class VC_Creator_Signin: UIViewController, UITextFieldDelegate {

    @IBOutlet var fld_password: UITextField!
    @IBOutlet var fld_username: UITextField!
    @IBOutlet weak var SigninBtn: UIButton!
    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        
        //text field stylings
       
        fld_password.layer.cornerRadius = 4
        fld_username.layer.cornerRadius = 4
        SigninBtn.layer.cornerRadius = 4
        
        
    }
    @IBAction func BtnTapped(_ sender: Any) {
        dataSource.username = fld_username.text;
        if let email = fld_username.text, let pass = fld_password.text
        {
            
            SVProgressHUD.show(withStatus: "Logging In")
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                SVProgressHUD.dismiss()
                
                
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
        //setUser()

    }
    
    func setUser(){ //set userUID value here 
        
        if let user = FIRAuth.auth()?.currentUser?.uid{
            self.userUid = user
        }
        
        keychain()
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: "uid"){ //retrive from keychain
            
            self.performSegue(withIdentifier: "goToHome", sender: self)
            
        }
        
}
 */
    func keychain(){
       
        KeychainWrapper.standard.set(userUid, forKey: "uid") //set uid value in keychain
    }

}
