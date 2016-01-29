//
//  PostsDataSource.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/29/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class PostsDataSource: NSObject, UITableViewDataSource {
  
  var posts: [Post] = [] {
    didSet {
      postsTableView?.reloadData()
    }
  }
  
  var dataProvider = PostsDataProvider()
  weak var postsTableView: UITableView?
  
  override init() {
    super.init()
    dataProvider.getMedia() { posts in
      self.posts = posts
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
    cell.post = posts[indexPath.row]
    cell.layoutContent()
    return cell
  }
  
}