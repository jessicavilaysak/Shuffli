//
//  ViewControllerViewposts.swift
//  Test
//
//  Created by Jessica Vilaysak on 10/5/17.
//  Copyright © 2017 Pranav Joshi. All rights reserved.
//

import UIKit

class ViewControllerViewposts: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet var viewposts: UITableView!
    
    @IBAction func buttonApprove(sender: UIButton) {
        let refreshAlert = UIAlertController(title: "SUBMIT TO DASHBOARD", message: "Are you sure you wish to submit this post?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            
            var index = Int(sender.tag);
            
            //delete from data source
            if index == dataSource.postsobj.count
            {
                index = index - 1
            }
            dataSource.postsobj.remove(at: index);
            
            //tell collection view data source has changed
            let item = IndexPath(item: index, section: 0);
            self.viewposts.deleteRows(at: [item], with: UITableViewRowAnimation.fade)
            
            print("Handle Ok logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func buttonDelete(sender: UIButton) {
       
        let refreshAlert = UIAlertController(title: "DELETE", message: "Are you sure you wish to delete this post?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            
            var index = Int(sender.tag);
            
            //delete from data source
            if index == dataSource.postsobj.count
            {
                index = index - 1
            }
            dataSource.postsobj.remove(at: index);
            
            //tell collection view data source has changed
            let item = IndexPath(item: index, section: 0);
            self.viewposts.deleteRows(at: [item], with: UITableViewRowAnimation.fade)
            
            print("Handle Ok logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }

    
    override func viewDidLoad() {
        
                super.viewDidLoad()
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
        let cell = self.viewposts.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomCell
        //cell.photo.image = imageArray[indexPath.row]
        print("count: "+String(dataSource.postsobj.count))
        if indexPath.row < dataSource.postsobj.count
        {
            print("row: "+String(indexPath.row))
            let temp = dataSource.postsobj[indexPath.row]
            cell.photo.image = temp.image
            cell.fld_caption.text = temp.caption
    
            
        }
        cell.buttonApprove.addTarget(self, action: #selector(buttonApprove), for: UIControlEvents.touchUpInside)
        cell.buttonApprove.tag = indexPath.row
        
        cell.buttonDelete.addTarget(self, action: #selector(buttonDelete), for: UIControlEvents.touchUpInside)
        cell.buttonDelete.tag = indexPath.row
        
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
