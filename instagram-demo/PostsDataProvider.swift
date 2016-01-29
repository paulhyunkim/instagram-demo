//
//  PostsDataProvider.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/29/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostsDataProvider {
  
  func getMedia(completionHandler: (posts: [Post]) -> () = { _ in }) {
    Alamofire.request(.GET, "https://api.instagram.com/v1/users/self/media/recent/?access_token=\(accessToken)", parameters: ["count": 2])
      .responseJSON { response in
        guard let responseValue = response.result.value else { return }
        let json = JSON(responseValue)
        let jsonData = json["data"].arrayValue
        let posts = jsonData.map { Post(json: $0) }
        completionHandler(posts: posts)
        //        self.postsTableView?.reloadData()
    }
  }
  
}
