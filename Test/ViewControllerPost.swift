//
//  ViewControllerPost.swift
//  Test
//
//  Created by Jessica Vilaysak on 11/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class ViewControllerPost: UIViewController, UITextViewDelegate {

    @IBOutlet var fld_caption: UITextView!
    @IBOutlet var fld_photo: UIImageView!
    
    var count = 1
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fld_caption.delegate = self
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func buttonPost(_ sender: Any) {
        let caption = fld_caption.text
        let image = fld_photo.image
        dataSource.postsobj.append((image: image!, caption: caption!))
        
        fld_photo.image = #imageLiteral(resourceName: "whiteBg")
        fld_caption.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonSelectImage(_ sender: Any) {

        fld_photo.image = UIImage(named: String(count))
        if(count < 4)
        {
            count = count + 1
        }
        else
        {
            count = 1
        }
        
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
