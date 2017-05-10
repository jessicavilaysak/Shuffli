//
//  ViewControllerHomePage.swift
//  Test
//
//  Created by Jessica Vilaysak on 10/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class ViewControllerHomePage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBAction func buttonDeleteUser(_ sender: Any) {
        
        
        
    }
    @IBOutlet var fld_nouser: UILabel!
    
    @IBOutlet var viewusers: UICollectionView!
    override func viewDidLoad() {
        
        if dataSource.userArray.count > 0
        {
            fld_nouser.isHidden = true
        }
        super.viewDidLoad()
        viewusers.reloadData()
        // Do any additional setup after loading the view
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if dataSource.userArray.count > 0
        {
            fld_nouser.isHidden = true
        }
        viewusers.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.userArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomCellUser = collectionView.dequeueReusableCell(withReuseIdentifier: "cellUser", for: indexPath) as! CustomCellUser
        cell.fld_username.text = dataSource.userArray[indexPath.row]
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
