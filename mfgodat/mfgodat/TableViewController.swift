//
//  TableViewController.swift
//  mfgodat
//
//  Created by iMac on 2018/12/16.
//  Copyright © 2018 numberOne. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class TableViewController: UITableViewController {

    var images:[Int:UIImage] = [:]
    var json = JSON()
    var count = 0
    var myImage:UIImage!
    var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "LabelCell")

        // Uncomment the following line to preserve selection between presentations

        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "progress") {
            presentedViewController.providesPresentationContextTransitionStyle = true
            presentedViewController.definesPresentationContext = true
            self.present(presentedViewController, animated: false, completion: nil)

            // get all image data from server
            let url = "http://ff8aaf.com/myapp/mfgodat_qu/show_items.php?x=y"
            getAll(endUrl: url, onCompletion: { (data) in

                self.json = JSON(data!)
                self.count = self.json.count

                // dismiss progress
                presentedViewController.dismiss(animated: true, completion: nil)

                self.do_table_refresh()

            }) { (err) in
                print(err!)
            }
        }
    }
    
    
    func do_table_refresh(){
        DispatchQueue.main.async(execute: {
            
            self.tableView.reloadData()
            return
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! TableViewCell
        
        
        let imagePath = json[indexPath.row]["image_url"]
                let url1 = "http://ff8aaf.com/myapp/mfgodat_qu/upload_images_app/uploads/\(imagePath)"
     
        
                dwonloadImage(endUrl: url1, onCompletion: { (image) in
        
                    cell.mainImageView.image = image
        
                }) { (err) in
                    print(err!)
                }
        
        cell.title.text = "\(json[indexPath.row]["item_details"])"
        cell.dateLabel.text = "\(json[indexPath.row]["real_date"])"
        cell.locationLabel.text = "\(json[indexPath.row]["item_place"])"
        
        let item_state = "\(json[indexPath.row]["item_state"])"
        
        cell.foundTitle.text = item_state
        
        if item_state == "عثر عليه" {
            cell.foundView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            cell.foundViewImage.image = UIImage(named: "happy")
            
        }else {
            cell.foundView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            cell.foundViewImage.image = UIImage(named: "sad")
            
        }
        
        return cell
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


