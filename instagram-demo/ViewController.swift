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

  override func viewDidLoad() {
    super.viewDidLoad()
    
    getMedia()
  }
  
//  func doOAuthInstagram(serviceParameters: [String:String]) {
//    let oauthswift = OAuth2Swift(
//      consumerKey:    "0708237882e64a24bebaac62c74b2088",
//      consumerSecret: "ed73b3e8b0bc4b128a01252ae496fc65",
//      authorizeUrl:   "https://api.instagram.com/oauth/authorize",
//      responseType:   "token"
//    )
//    
//    let state: String = generateStateWithLength(20) as String
//    oauthswift.authorize_url_handler = get_url_handler()
//    oauthswift.authorizeWithCallbackURL( NSURL(string: "oauth-swift://oauth-callback/instagram")!, scope: "likes+comments", state:state, success: {
//      credential, response, parameters in
//      self.showTokenAlert(serviceParameters["name"], credential: credential)
//      self.testInstagram(oauthswift)
//      }, failure: { error in
//        print(error.localizedDescription)
//    })
//  }
//  
//  func testInstagram(oauthswift: OAuth2Swift) {
//    let url :String = "https://api.instagram.com/v1/users/1574083/?access_token=\(oauthswift.client.credential.oauth_token)"
//    let parameters :Dictionary = Dictionary<String, AnyObject>()
//    oauthswift.client.get(url, parameters: parameters,
//      success: {
//        data, response in
//        let jsonDict: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
//        print(jsonDict)
//        
//      }, failure: { error in
//        print(error)
//    })
//  }
  
  func getMedia() {
    Alamofire.request(.GET, "https://api.instagram.com/v1/users/self/media/recent/?access_token=\(accessToken)", parameters: ["count": 2])
      .responseJSON { response in
        guard let responseValue = response.result.value else { return }
        let json = JSON(responseValue)
//        guard let json = response.result.value else { return }
        print(json)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

