//
//  Book.swift
//  BookListApp
//
//  Created by Steve JobsOne on 2/15/19.
//  Copyright © 2019 MobioApp Limited. All rights reserved.
//

import UIKit

class Book: NSObject {
    var name: String?
    var author: String?
    var cover: String?
    var deatailsInfo: String?
    
     init(name:String, author:String, cover:String, info:String) {
        self.name = name
        self.author = author
        self.cover = cover
        self.deatailsInfo = info
    }
}
