//
//  Actions.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import Foundation
import Suas

// MARK: - Action

struct FetchArticlesAsyncAction: AsyncAction {
    
    func execute(getState: @escaping GetStateFunction, dispatch: @escaping DispatchFunction) {
        
        // Set the url
        let url = URL(string:"https://support.zendesk.com/api/v2/help_center/en-us/sections/200623776/articles.json")!
        
        // Perform async request
        URLSession(configuration: .default).dataTask(with: url) { data, response, error in
            
            // When async request is done, dispatch actions
            let resp = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
            let section = Section(JSON: resp)
            
            // Dispatch action with parsed data
            dispatch(ArticlesFetchedAction(section: section!))
            }.resume()
    }
}

struct ArticlesFetchedAction: Action {
    let section: Section
}
