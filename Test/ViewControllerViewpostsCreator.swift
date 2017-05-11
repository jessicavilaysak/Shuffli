//
//  ViewControllerViewpostsCreator.swift
//  Test
//
//  Created by Jessica Vilaysak on 11/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class ViewControllerViewpostsCreator: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var viewposts: UITableView!

    @IBOutlet var fldusername: UILabel!
    
    @IBOutlet var fldcompany: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fldusername.text = "CreatorMan01"
        fldcompany.text = "Cotton On (Eastland)"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewposts.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.postsobj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.viewposts.dequeueReusableCell(withIdentifier: "cellCreator", for: indexPath as IndexPath) as! CustomCellCreator
        //cell.photo.image = imageArray[indexPath.row]
        print("count: "+String(dataSource.postsobj.count))
        if indexPath.row < dataSource.postsobj.count
        {
            print("row: "+String(indexPath.row))
            let temp = dataSource.postsobj[indexPath.row]
            cell.photo.image = temp.image
            cell.fld_caption.text = temp.caption
            
            
        }
        
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
