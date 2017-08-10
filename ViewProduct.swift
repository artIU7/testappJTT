//
//  ViewProduct.swift
//  testAPPjtt
//
//  Created by Артем Стратиенко on 10.08.17.
//  Copyright © 2017 Артем Стратиенко. All rights reserved.
//

import Foundation
import Alamofire
class ViewProduct: UITableViewController {
    
    
@IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 1
    }
    //
    func loadDatanameCategories() -> String{
        let API_URL:String = "https://api.producthunt.com/v1/categories"
        let API_KEY:String = "591f99547f569b05ba7d8777e2e0824eea16c440292cce1f8dfb3952cc9937ff"
        let parameters:[String:String] = [
        "":""
         
        ]
        let headerParameters:[String:String] = [
            "Accept":"application/json",
            
            "Content-Type":"application/json",
            "Authorization":API_KEY,
            "Host": "api.producthunt.com"
            //"Authorization": "just example of header parameter"
        ]
        print(parameters)
         var nameCat=String()
        Alamofire.request(API_URL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headerParameters)
            .responseJSON { response in
              
                if let JSON:[String:Any] = response.result.value as? [String:Any] {
                    let nameOject:[String:Any] = JSON["categories"] as! [String:Any]
                   nameCat = nameOject["name"] as! String
              
                }
        }
              return nameCat
    }
    //
    func loadDataproduct() {
        let API_URL:String = "https://api.producthunt.com/v1/collections?search[category]=category-1"
        let API_KEY:String = "591f99547f569b05ba7d8777e2e0824eea16c440292cce1f8dfb3952cc9937ff"
        let parameters:[String:String] = [
            "search[category]":loadDatanameCategories()
            
        ]
        let headerParameters:[String:String] = [
            "Accept":"application/json",
            "Content-Type":"application/json",
            "Authorization":API_KEY,
            "Host": "api.producthunt.com"
        ]
        print(parameters)
        
        Alamofire.request(API_URL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headerParameters)
            .responseJSON { response in
                
                if let JSON:[String:Any] = response.result.value as? [String:Any] {
                    
                    let nameOject:[String:Any] = JSON["collections"] as! [String:Any]
                    let nameCat:String = nameOject["name"] as! String
                    let titleProduct:String = nameOject["title"] as! String
                    let productupvotes:Int = nameOject["subscriber_count"] as! Int
                    let productThunmb:UIImage = nameOject["background_image_url"] as! UIImage
                }
        }
    }
    //
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productID", for: indexPath) as! ViewProductCell
        
        // Configure the cell...
        
        
        if indexPath.row == 0 {
            cell.collections_name.text = "product"//nameCat
            cell.collections_Thumbnail.image = UIImage(named: "u1")//productThunmb
            cell.collections_title.text = "ll"//titleProduct
            cell.collections_upvotes.text = "2"//productupvotes
           cell.collections_subscriber.text = "count_subscriber"//
        }
    
        return cell
}
}
    
