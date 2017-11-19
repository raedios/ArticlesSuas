//
//  Reducers.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import Foundation
import Suas

// MARK: - Reducer

struct FetchArticlesReducer: Reducer {
    
    var initialState = SerchSection(section: Section())
    
    func reduce(state: SerchSection, action: Action) -> SerchSection? {
        
        // Handle the fetch action
        if let action = action as? ArticlesFetchedAction {
            
            return SerchSection(section: action.section)
        }
        
        if let _ = action as? ArticlesFetchEnded {
            
            return SerchSection(section: Section())
        }
        
        return nil
    }
}
