//
//  CircleView.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/9/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import UIKit
class CircleView: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY , green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: SHADOW_GRAY).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        self.clipsToBounds = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.size.width / 2
    }
}
