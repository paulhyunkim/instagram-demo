//
//  Post.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/28/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Post {
  
  var id: String
  var createdTime: String
  var caption: String
  var username: String
  var profilePicture: String
  var image: Image
  var video: Video?
  
  struct Image {
    var url: NSURL
    var width: Int
    var height: Int
  }
  
  struct Video {
    var url: NSURL
    var width: Int
    var height: Int
  }
  
  init(json: JSON) {
    id = json["id"].stringValue
    createdTime = json["created_time"].stringValue
    caption = json["caption"]["text"].stringValue
    username = json["user"]["username"].stringValue
    profilePicture = json["user"]["profile_picture"].stringValue
    
    let imageJSON = json["images"]["standard_resolution"]
    image = Image(url: NSURL(string: imageJSON["url"].stringValue)!, width: imageJSON["width"].intValue, height: imageJSON["height"].intValue)
    
    if json["videos"]["standard_resolution"].isExists() {
      let videoJSON = json["videos"]["standard_resolution"]
      video = Video(url: NSURL(string: videoJSON["url"].stringValue)!, width: videoJSON["width"].intValue, height: videoJSON["height"].intValue)
    }
  }
  
}