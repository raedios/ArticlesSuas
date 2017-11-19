//
//  Article.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import Foundation
import ObjectMapper

class Article: Mappable {
    
    // MARK: - Properties
    
    var id: UInt?
    var url: String?
    var htmlUrl: String?
    var authorId: Int?
    var commentsDisabled: Bool?
    var draft: Bool?
    var promoted: Bool?
    var position: Int?
    var voteSum: Int?
    var voteCount: Int?
    var sectionId: Int?
    var createdAt: Date?
    var updatedAt: Date?
    var name: String?
    var title: String?
    var body: String?
    var sourceLocale: String?
    var locale: String?
    var outdated: Bool?
    var outdatedLocales: [String]?
    var labelNames: [String]?
    
    // MARK: - Initializers
    
    required init?(map: Map) {
        
    }
    
    // MARK: - Mapping
    
    func mapping(map: Map) {
        
        id <- map["id"]
        url <- map["url"]
        htmlUrl <- map["html_url"]
        authorId <- map["author_id"]
        commentsDisabled <- map["comments_disabled"]
        draft <- map["draft"]
        promoted <- map["promoted"]
        position <- map["position"]
        voteSum <- map["vote_sum"]
        voteCount <- map["vote_count"]
        sectionId <- map["section_id"]
        createdAt <- (map["created_at"], DateTransform())
        updatedAt <- (map["updated_at"], DateTransform())
        name <- map["name"]
        title <- map["title"]
        body <- map["body"]
        sourceLocale <- map["source_locale"]
        locale <- map["locale"]
        outdated <- map["outdated"]
        outdatedLocales <- map["outdated_locales"]
        labelNames <- map["label_names"]
    }
}
