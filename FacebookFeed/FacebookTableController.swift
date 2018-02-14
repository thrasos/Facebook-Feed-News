//
//  ViewController.swift
//  FacebookFeed
//
//  Created by Thrasos on 19/01/2018.
//  Copyleft © 2018 Thrasos. 
//

import UIKit
import Alamofire
import SwiftyJSON

class FacebookTableController: UITableViewController {
    let networkWarning = UIView()
     var json : JSON = JSON.null
    let screenSize:CGRect = UIScreen.main.bounds
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.setContentOffset(CGPoint.zero, animated: true)
        getFacebookFeed()
          }
    
    
    @objc func getFacebookFeed() {
        let ContentCode : String = "YOUR_FAN_PAGE" //eg"linuxfanofficial"
        let AccessToken : String = "YOUR_ACCESS_TOKEN" //eg."174400156661138|fjeb10iTH762N9frGtuPSdb4qok"
        let facebookfeed: String = "https://graph.facebook.com/" + ContentCode + "/feed?fields=link,full_picture,name,created_time,type,shares,likes{pic_small,id,name},source,message,description,icon&access_token=" + AccessToken
        
        let latestNews1 = facebookfeed.addingPercentEncoding(withAllowedCharacters : .urlQueryAllowed)!
        Alamofire.request(latestNews1, method: .get).responseJSON { response in
            guard let data = response.result.value else {
                print("Request failed with error. Url: \(latestNews1)")
                return
            }
            self.json = JSON(data)
            self.tableView.isUserInteractionEnabled = true
            self.tableView.separatorStyle = .none
            self.tableView.setContentOffset(CGPoint.zero, animated: true)
            self.tableView.reloadData()
            
        }
    }
    
    /*
     A little bit of logic for retrieving the title.
     Facebook lacks a specific title key for the posts.
     The content of facebook posts can vary (text, image, gallery, video etc).
     Galleries etc normaly use the a key called "name" so I use that as a title.
     Otherwise I just get the string from the "message" and let the Label handle the rest.
     
     */
    
    func populateFields(_ cell: FBCell, index: Int) {
        if self.json["data"][index]["name"].string != nil  {
            let title = self.json["data"][index]["name"].string
            cell.FBpostTitle!.text = String(title!)
        }else {
            if self.json["data"][index]["message"].string != nil {
                            let title = self.json["data"][index]["message"].string
                            cell.FBpostTitle!.text = String(title!)
            }else {
                let title = self.json["data"][index]["message"].string
                cell.FBpostTitle!.text = String(title!)
                
            }
        }
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.json["data"].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FBCell", for: indexPath) as! FBCell
        populateFields(cell, index: (indexPath as NSIndexPath).row)
        return cell
    }
    
    
}



 
