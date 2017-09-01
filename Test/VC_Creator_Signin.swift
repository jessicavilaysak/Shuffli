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
import Spring

class VC_Creator_Signin: UIViewController, UITextFieldDelegate {

    @IBOutlet var fld_password: UITextField!
    @IBOutlet var fld_username: UITextField!
    @IBOutlet weak var SigninBtn: UIButton!
    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        SigninBtn.layer.cornerRadius = 4
    }
    
    
    @IBAction func BtnTapped(_ sender: Any) {
        
        dataSource.username = fld_username.text;
        if let email = fld_username.text, let pass = fld_password.text
        {
            SVProgressHUD.show(withStatus: "Logging In")
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                SVProgressHUD.showSuccess(withStatus: "Logged in!")
                SVProgressHUD.dismiss(withDelay: 1)
                
                if user != nil{
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                    self.setUser()
                }
                else{
                    SVProgressHUD.showError(withStatus: "Login Failed, Please try again")
                    SVProgressHUD.dismiss(withDelay: 6)
                    print(error!);
                }
                
            })
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if FIRAuth.auth()?.currentUser != nil{
            self.performSegue(withIdentifier: "goToHome", sender: self)
            setUser()
        }else{
            print("User is null")
        }
        
    }
    
    func setUser(){ //set userUID value here 
        
        if let user = FIRAuth.auth()?.currentUser?.uid{
            dataSource.uid = user
            KeychainWrapper.standard.set(dataSource.uid, forKey: "uid") //set uid value in keychain
        }
        
        //keychain()
    }
}


















    

 
//    func keychain(){
//       
//        KeychainWrapper.standard.set(dataSource.uid, forKey: "uid") //set uid value in keychain
//    }
    // if let key = KeychainWrapper.standard.string(forKey: "uid"){//retrive from keychain

    
    
    
    //                    let alert = UIAlertController(title: "Login Failed", message: "Enter correct username or password", preferredStyle: UIAlertControllerStyle.alert);
    //                    let cancelAction = UIAlertAction(title: "OK",
    //                                                     style: .cancel, handler: nil)
    //                    alert.addAction(cancelAction)
    //
    //                    self.present(alert,animated: true){
    //
    //                    }
    


