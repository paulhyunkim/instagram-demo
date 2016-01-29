//
//  PostsViewController.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/28/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import UIKit
import Haneke
import SwiftyJSON
//import OAuthSwift
import Alamofire

let accessToken = "37029106.0708237.84ac9e82a92447ea92f48cc8f849846e"

class PostsViewController: UIViewController {

  @IBOutlet weak var postsTableView: UITableView!
  
  var dataSource: PostsDataSource?
  var dataProvider: PostsDataProvider?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNibs()
    dataSource = PostsDataSource()
    dataSource?.postsTableView = postsTableView
    postsTableView.dataSource = dataSource
    postsTableView.delegate = self
  }

  func registerNibs() {
    postsTableView.registerNib(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
  }

}


extension PostsViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 300
  }
  
}
