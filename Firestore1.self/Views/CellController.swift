//
//  CellController.swift
//  Firestore1.self
//
//  Created by 関口大海 on 2019/07/05.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit

class CellController: UITableViewCell {
    
    // UI部品の宣言
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var numLikesLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // セルを構築するメソッドを宣言
    func configureCell(posty: Post) {
        
        titleLabel.text = posty.title
        contentLabel.text = posty.content
        numLikesLabel.text = String(posty.numLikes)
//        timestampLabel.text = posty.timestamp
        
        // Date型からString型bの日付を生成
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, hh:mm"
        let timestampy = formatter.string(from: posty.timestamp)
        timestampLabel.text = timestampy
        print(timestampy)
    }
    
    
}
