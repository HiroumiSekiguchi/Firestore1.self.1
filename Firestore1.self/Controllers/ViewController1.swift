//
//  ViewController.swift
//  Firestore1.self
//
//  Created by 関口大海 on 2019/07/04.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit

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
    
    // Postクラスのインスタンス
//    var posty = Post()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableViewのデリゲートメソッドの有効化
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    // ☆☆☆以下、tableViewに関する設定☆☆☆ //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}

