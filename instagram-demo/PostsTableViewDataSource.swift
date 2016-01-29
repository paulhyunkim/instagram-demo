//
//  PostsTableViewDataSource.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/29/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import Foundation
import UIKit

class PostsTableViewDataSource: NSObject, UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
    return cell
  }
  
}