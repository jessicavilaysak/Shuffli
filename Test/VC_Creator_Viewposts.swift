//
//  ViewControllerViewpostsCreator.swift
//  Test
//
//  Created by Jessica Vilaysak on 11/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper
import FirebaseDatabase
import SDWebImage
import SVProgressHUD

class VC_Creator_Viewposts: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var viewposts: UITableView!

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet var fldusername: UILabel!
    
    @IBOutlet var fldcompany: UILabel!
    
    var images = [imageDataModel]()
    var dbRef : FIRDatabaseReference!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        fldusername.text = FIRAuth.auth()?.currentUser?.email;
        //dataSource.username;
       
        fldcompany.text = "Cotton On (Eastland)"
        self.hideKeyboardWhenTappedAround()
        
        loadImagesfromDb()
        
        //Creating a shadow
        bgImage.layer.masksToBounds = false
        bgImage.layer.shadowColor = UIColor.black.cgColor
        bgImage.layer.shadowOffset = CGSize(width: 1.0, height:1.0)
        bgImage.layer.shadowOpacity = 0.5
        bgImage.layer.shadowRadius = 10;
        bgImage.layer.shouldRasterize = true //tells IOS to cache the shadow

}

    func loadImagesfromDb(){
        FIRAuth.auth()?.addStateDidChangeListener({ (auth: FIRAuth,user: FIRUser?) in
        
            if user != nil {
                print("uid: "+dataSource.uid)
                print(user!)
                self.dbRef.child("userPosts/-KsnTZDmU_xD1A1WLUiQ/001CottonOn").child(dataSource.uid).observe(FIRDataEventType.value, with: {(snapshot) in
                    var newImages = [imageDataModel]()
                    
                    for imageSnapshot in snapshot.children{
                        let imgObj = imageDataModel(snapshot: imageSnapshot as! FIRDataSnapshot)
                        newImages.append(imgObj)
                    }
                    
                    self.images = newImages
                    self.viewposts.reloadData()
                })
            }
       
            
        })
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        viewposts.reloadData()
        
        let tabItems = self.tabBarController?.tabBar.items;
        let tabItem = tabItems?[0]
        dataSource.postNotifications = 0;
        tabItem?.badgeValue = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.viewposts.dequeueReusableCell(withIdentifier: "cellCreator", for: indexPath as IndexPath) as! CustomCellCreator
        print(images.count);
        if indexPath.row < images.count
        {
            let image = images[indexPath.row]
            //let temp = dataSource.postsobj[indexPath.row]
            cell.photo.sd_setShowActivityIndicatorView(true)
            cell.photo.sd_setIndicatorStyle(.gray)
            cell.photo.sd_setImage(with: URL(string: image.url),placeholderImage: UIImage(named: "placeholder"))
            cell.imageCaption.text = image.caption
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: "cellToVc") as! VC_CellToVCViewController
        
        let image = images[indexPath.row]
        destVC.imagesDv =  image.url                
        destVC.captionDv = image.caption
        
        self.navigationController?.pushViewController(destVC, animated: true)
        
    }
    
    
    @IBAction func logout(_ sender: Any) {
        if FIRAuth.auth()?.currentUser != nil {
            do{
                try FIRAuth.auth()?.signOut()
                self.performSegue(withIdentifier: "goToSignin", sender: self)
                           } catch let error as NSError{
                print(error)
            }
        }else{
            print("User is nill")
        }
    }
}




//dataSource.uid = ""
//KeychainWrapper.standard.set(dataSource.uid, forKey: "uid")


