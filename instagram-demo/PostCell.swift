//
//  PostCell.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/29/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import UIKit
import Haneke
import AVKit
import AVFoundation

class PostCell: UITableViewCell {
  
  @IBOutlet weak var postTitleLabel: UILabel!
  @IBOutlet weak var postImageView: UIImageView!
  
  var post: Post?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func layoutContent() {
    postTitleLabel.text = post?.id
    postImageView.hnk_setImageFromURL(post!.image.url)
    

    if post?.video != nil {
      let player = AVPlayer(URL: (post?.video?.url)!)
      let playerController = AVPlayerViewController()
      playerController.player = player
      self.contentView.addSubview(playerController.view)
      playerController.view.frame = postImageView.frame
//      playerController.player?.play()
    }
  }
  
}
