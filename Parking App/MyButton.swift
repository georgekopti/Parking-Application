//
//  MyButton.swift
//  Parking App
//
//  Created by Xcode User on 2019-11-29.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class MyButton: UIButton {
    
    @IBOutlet var btn_SignUp: UIButton!
    
    override init(frame: CGRect) {
     super.init(frame: frame)
     setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup() {
        btn_SignUp = loadViewFromNib() as! UIButton?
      btn_SignUp.frame = bounds
      
        btn_SignUp.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                       UIView.AutoresizingMask.flexibleHeight]
      
      addSubview(btn_SignUp)
      
      // Add our border here and every custom setup
      btn_SignUp.layer.borderWidth = 2
      btn_SignUp.layer.borderColor = UIColor.white.cgColor
      btn_SignUp.titleLabel!.font = UIFont.systemFont(ofSize: 40)
    }
    
    func loadViewFromNib() -> UIView! {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
      let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIButton
      
      return view
    }
    
    
}
