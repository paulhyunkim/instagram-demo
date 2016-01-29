//
//  ViewController.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/28/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import UIKit
import Haneke
import SwiftyJSON
import OAuthSwift
import Alamofire

let accessToken = "37029106.0708237.84ac9e82a92447ea92f48cc8f849846e"

class ViewController: UIViewController {

  @IBOutlet weak var postsTableView: UITableView!
  
  var dataSource: PostsTableViewDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNibs()
    dataSource = PostsTableViewDataSource()
    postsTableView.dataSource = dataSource
    postsTableView.delegate = self
    
    getMedia()
  }

  func registerNibs() {
    postsTableView.registerNib(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
  }
  
  func getMedia() {
    Alamofire.request(.GET, "https://api.instagram.com/v1/users/self/media/recent/?access_token=\(accessToken)", parameters: ["count": 2])
      .responseJSON { response in
        guard let responseValue = response.result.value else { return }
        let json = JSON(responseValue)
        let jsonData = json["data"].arrayValue
        let posts = jsonData.map { Post(json: $0).image.url }
        print(posts)
    }
  }
  
  func makePost() {
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


extension ViewController: UITableViewDelegate {
  
  
  
}
