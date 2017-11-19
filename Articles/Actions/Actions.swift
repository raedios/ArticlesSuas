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
    
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func execute(getState: @escaping GetStateFunction, dispatch: @escaping DispatchFunction) {
        
        // Set the url
        guard let url = URL(string:self.url) else {
            
            dispatch(ArticlesFetchEnded(fetchEnded: true))
            return
        }
        
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

struct ArticlesFetchEnded: Action {
    let fetchEnded: Bool
}
