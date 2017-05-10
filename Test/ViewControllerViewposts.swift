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
    
    var imageArray = [UIImage(named: "drop"), UIImage(named: "drop"), UIImage(named: "drop"), UIImage(named: "drop"), UIImage(named: "drop"), UIImage(named: "drop")]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.viewposts.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomCell
        cell.photo.image = imageArray[indexPath.row]
        
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
