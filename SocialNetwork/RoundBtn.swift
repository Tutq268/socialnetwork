//
//  RoundBtn.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/7/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor =  UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        imageView?.contentMode = .scaleAspectFit
        self.clipsToBounds = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
        
    }

}
