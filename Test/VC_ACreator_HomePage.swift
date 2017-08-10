//
//  ViewControllerHomePage.swift
//  Test
//
//  Created by Jessica Vilaysak on 10/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit
class VC_ACreator_HomePage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var fldusername: UILabel!
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet var fldcompany: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    func deleteUserButton(sender: UITapGestureRecognizer) {
        var index = Int((sender.view?.tag)!);
        //delete from data source
        if index == dataSource.userArray.count
        {
            index -= 1
        }
        dataSource.userArray.remove(at: index);
        
        //tell collection view data source has changed
        let item = IndexPath(item: index, section: 0);
        self.collectionView.deleteItems(at: [item]);
    }
    
    @IBOutlet var fld_nouser: UILabel!

    @IBOutlet var viewusers: UICollectionView!
    override func viewDidLoad() {
        fldcompany.text = "Coffee Club (Eastland)"
        fldusername.text = dataSource.username;
        fld_nouser.isHidden = false;
        storeImage.image = Toucan(image: #imageLiteral(resourceName: "CoffeeClub")).maskWithEllipse().image;
        
        if dataSource.userArray.count > 0
        {
            fld_nouser.isHidden = true
        }
        super.viewDidLoad()
        viewusers.reloadData()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if dataSource.userArray.count > 0
        {
            fld_nouser.isHidden = true
        }
        viewusers.reloadData()
        
        let tabItems = self.tabBarController?.tabBar.items;
        let tabItem = tabItems?[0]
        dataSource.userNotifications = 0;
        tabItem?.badgeValue = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.userArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomCellUser = collectionView.dequeueReusableCell(withReuseIdentifier: "cellUser", for: indexPath) as! CustomCellUser
        cell.fld_username.text = dataSource.userArray[indexPath.row]
        
        cell.deleteUser.tag = indexPath.row;
        
        //set delete image as a touch,
        let singletap = UITapGestureRecognizer(target: self, action: #selector(deleteUserButton))
        singletap.numberOfTapsRequired = 1 // you can change this value
        cell.deleteUser.isUserInteractionEnabled = true
        cell.deleteUser.addGestureRecognizer(singletap)
        
        
        return cell
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
