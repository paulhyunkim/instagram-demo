//
//  PostContainerView.swift
//  instagram-demo
//
//  Created by Paul Kim on 1/29/16.
//  Copyright © 2016 Paul Kim. All rights reserved.
//

import UIKit

@IBDesignable
class PostContainerView: UIView {

  @IBInspectable var masksToBounds: Bool = false {
    didSet {
      layer.masksToBounds = masksToBounds
    }
  }

  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.CGColor
    }
  }
  
  @IBInspectable var shadowColor: UIColor? {
    didSet {
      layer.shadowColor = shadowColor?.CGColor
    }
  }
  
  @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
    didSet {
      layer.shadowOffset = CGSize(width: shadowOffset.width, height: shadowOffset.height)
    }
  }
  
  @IBInspectable var shadowOpacity: Float = 0 {
    didSet {
      layer.shadowOpacity = shadowOpacity
    }
  }

  @IBInspectable var shadowRadius: CGFloat = 0 {
    didSet {
      layer.shadowRadius = shadowRadius
    }
  }
  
}
