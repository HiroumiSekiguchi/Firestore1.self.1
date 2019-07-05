//
//  Post.swift
//  Firestore1.self
//
//  Created by 関口大海 on 2019/07/05.
//  Copyright © 2019 関口大海. All rights reserved.
//

import Foundation

class Post {
    
    var title = String()
    var content = String()
    var category = String()
    var numLikes = Int()
    var timestamp = Date()
    
    init(title: String, content: String, numLikes: Int, timestamp: Date) {
        
        self.title = title
        self.content = content
        self.numLikes = numLikes
        self.timestamp = timestamp
        
    }
    
}



