//
//  Post.swift
//  Firestore1.self
//
//  Created by 関口大海 on 2019/07/05.
//  Copyright © 2019 関口大海. All rights reserved.
//

import Foundation
import Firebase

var postArray = [Post]()

class Post {
    
    var title = String()
    var content = String()
    var category = String()
    var numLikes = Int()
    var timestamp = Date()
    
    init(category: String, title: String, content: String, numLikes: Int, timestamp: Date) {
        
        self.category = category
        self.title = title
        self.content = content
        self.numLikes = numLikes
        self.timestamp = timestamp
        
    }
    
    // クラスメソッドでリファクタリング
    class func parseData(snapshot: QuerySnapshot?) -> [Post] {
        guard let snap = snapshot else { return postArray }
        for document in snap.documents {
            
            let data = document.data()
            
            let title = data[TITLE] as? String ?? "タイトルなし"
            let content = data[CONTENT] as? String ?? "内容なし"
            let numLikes = data[NUM_LIKES] as? Int ?? 0
            let category = data[CATEGORY] as? String ?? PostCategory.funny.rawValue
            let timestamp = data[TIMESTAMP] as? Date ?? Date()
            
            // 上記に基づいたPostクラスのインスタンスを生成
            let newPost = Post(category: category, title: title, content: content, numLikes: numLikes, timestamp: timestamp)
            
            // 上記を配列に追加
            postArray.append(newPost)
        }
        return postArray
    }
    
}



