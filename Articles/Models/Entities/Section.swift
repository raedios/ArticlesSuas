//
//  Section.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import Foundation
import ObjectMapper

class Section: Mappable {
    
    var count: Int?
    var nextPage: String?
    var page: Int?
    var pageCount: Int?
    var perPage: Int?
    var previousPage: Int?
    var articles: [Article] = []
    var sortBy: String?
    var sortOrder: String?
    
    // MARK: - Initializers
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    // MARK: - Mapping
    
    func mapping(map: Map) {
        
        count <- map["count"]
        nextPage <- map["next_page"]
        page <- map["page"]
        pageCount <- map["page_count"]
        perPage <- map["per_page"]
        previousPage <- map["previous_page"]
        articles <- map["articles"]
        sortBy <- map["sort_by"]
        sortOrder <- map["sort_order"]
    }
}
