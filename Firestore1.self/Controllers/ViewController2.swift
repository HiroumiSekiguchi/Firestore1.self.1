//
//  ViewController2.swift
//  Firestore1.self
//
//  Created by 関口大海 on 2019/07/04.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextViewDelegate {
    
    
    // UI部品の宣言
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    
    // カテゴリー用の変数
    var category = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TextViewとボタンの角を丸くする
        textView.layer.cornerRadius = 5.0
        postButton.layer.cornerRadius = 5.0
        
        // TextViewにplacefolderを追加
        textView.text = "ここに新規投稿内容を追加"
        textView.textColor = UIColor.lightGray
        textView.delegate = self
        
    }
    
    // textViewタップでplacefolderの削除
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.darkGray
    }
    
    // segmentedControlの値によってcategoryの値を切り替える
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
    }
    
    
    // 投稿ボタンを押す＝Firebaseにデータを送信
    @IBAction func postButtonTapped(_ sender: Any) {
        
        
        
        
    }
    
    
    
    
    
    

}
