//
//  Post.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/28/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Post {
  
  var id: String
  var createdTime: String
  var caption: String
  
  init(json: JSON) {
    id = json["id"].stringValue
    createdTime = json["created_time"].stringValue
    caption = json["caption"]["text"].stringValue
  }
  
}