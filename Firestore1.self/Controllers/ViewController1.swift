//
//  ViewController.swift
//  Firestore1.self
//
//  Created by 関口大海 on 2019/07/04.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit
import Firebase

enum PostCategory: String {
    case funny = "funny"
    case serious = "serious"
    case crazy = "crazy"
    case popular = "popular"
}

class ViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // UI部品の宣言
    @IBOutlet weak var tableView: UITableView!
    
    // 投稿を格納する配列
    var postArray = [Post]()
    
    // Firebaseの参照元を指定するための初期変数を宣言
    var postsCollectionRef: CollectionReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableViewのデリゲートメソッドの有効化
        tableView.delegate = self
        tableView.dataSource = self
        
        // Firebaseの参照元を指定
        postsCollectionRef = Firestore.firestore().collection(POSTS)
        
    }
    
    
    // ☆☆☆viewWillAppear内でFirebaseからデータを取得☆☆☆ //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        postsCollectionRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("エラー：\(err)")
            } else {
                // 配列を初期化
                self.postArray = [Post]()
                guard let snap = snapshot else { return }
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
                    self.postArray.append(newPost)
                    
                }
                // 配列のカウントができているか
//                print(self.postArray.count)
                
                // ここでtableViewをリロードするのを忘れないように！
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    
    
    
    
    // ☆☆☆以下、tableViewに関する設定☆☆☆ //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // タップされたセルをdeselectedに戻す
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 128
        
    }
    
    
}

