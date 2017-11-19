//
//  ArticleCell.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    // MARK: - Views
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bodySubset: UILabel!
    @IBOutlet weak var lastUpdate: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - UI Update
    
    func configure(with article: Article) {
     
        title.text = article.title
        bodySubset.text = article.body
        lastUpdate.text = "Last Update: \(article.updatedAt?.shortFormatString() ?? "")"
    }
}
