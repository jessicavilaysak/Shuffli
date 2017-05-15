//
//  ViewControllerGenerate.swift
//  Test
//
//  Created by Jessica Vilaysak on 9/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class VC_ACreator_adduser: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btn_generate: UIButton!
    @IBOutlet weak var fld_password: UITextField!
    @IBOutlet weak var fld_username: UITextField!
    
    var userCount : Int = 0;

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fld_password.text = ""
        fld_username.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickBtnGenerate(_ sender: UIButton) {
        //let tempString : String = "temp_user_";
        var tempString = "temp_user_";
        let userCount : Int = dataSource.currentCount
        if(userCount < 10)
            {tempString += "0"+String(userCount);}
        else
            {tempString += String(userCount);}
        
        fld_username.text = tempString;
        dataSource.userArray.append(tempString)
        tempString = "";
        var i=0;
        while i < 6 {
            tempString += String(arc4random_uniform(10));
            i = i + 1;
        }
        fld_password.text = tempString;
        dataSource.currentCount = dataSource.currentCount + 1
        
        let tabItems = self.tabBarController?.tabBar.items;
        let tabItem = tabItems?[0]
        dataSource.userNotifications = dataSource.userNotifications + 1;
        tabItem?.badgeValue = String(dataSource.userNotifications)
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
