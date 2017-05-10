//
//  ViewControllerGenerate.swift
//  Test
//
//  Created by Jessica Vilaysak on 9/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class ViewControllerGenerate: UIViewController {

   
    @IBOutlet weak var btn_generate: UIButton!
    @IBOutlet weak var fld_password: UITextField!
    @IBOutlet weak var fld_username: UITextField!
    
    var userCount : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickBtnGenerate(_ sender: UIButton) {
        //let tempString : String = "temp_user_";
        var tempString = "temp_user_";
       
        if(userCount < 10)
            {tempString += "0"+String(userCount);}
        else
            {tempString += String(userCount);}
        
        fld_username.text = tempString;
        tempString = "";
        var i=0;
        while i < 6 {
            tempString += String(arc4random_uniform(10));
            i = i + 1;
        }
        fld_password.text = tempString;
        self.userCount = self.userCount + 1;
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