//
//  CellFeed.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/9/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import UIKit

class CellFeed: UITableViewCell {

    @IBOutlet weak var lblNumLike: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgAnhHienThi: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var lblStt: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    var post:Posts!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureCell(posts: Posts)
    {
        self.post = posts
        self.lblNumLike.text = "\(posts.like)"
        self.lblStatus.text = posts.caption
        let url:URL = URL(fileURLWithPath: posts.imageUrl)
        do {
        let data:Data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.imgAnhHienThi.image = UIImage(data: data)
            }
            }catch{}
       
    }

}
