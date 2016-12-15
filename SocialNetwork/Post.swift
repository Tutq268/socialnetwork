
//
//  Post.swift
//  SocialNetwork
//
//  Created by Tú Trần on 12/15/16.
//  Copyright © 2016 tutran. All rights reserved.
//

import Foundation
import UIKit
class Posts {
    private var _caption:String!
    private var _imageUrl:String!
    private var _like:Int!
    private var _key:String!
    var caption:String {
    return _caption
    }
    var imageUrl:String {
    return _imageUrl
    }
    var like:Int {
    return _like
    }
    var key:String {
    return _key
    }
    init(caption:String,imageUrl:String,like:Int) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._like = like
    }
    init(forkey:String,arrData: Dictionary<String,AnyObject>)
    {
     self._key = forkey
        if let caption = arrData["caption"] as? String
        {
        self._caption = caption
        }
        if let imageUrl = arrData["imageUrl"] as? String {
        self._imageUrl = imageUrl
        }
        if let like = arrData["like"] as? Int
        {
        self._like = like
        }
    }
}
