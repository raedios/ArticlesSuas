//
//  ArticlesViewController.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import UIKit
import Suas

// MARK: - Store

let store = Suas.createStore(reducer: FetchArticlesReducer(), middleware: AsyncMiddleware())

// MARK: - ViewController

class ArticlesViewController: UIViewController, UITableViewDataSource {

    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var subscription: Subscription<SerchSection>?
    var stateSection = Section()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dispatch the Fetch Articles Async Action
        store.dispatch(action: FetchArticlesAsyncAction())

        // Add a listener to the store
        subscription = store.addListener(forStateType: SerchSection.self)  { [weak self] state in

            // Update UI
            print("Sections: \(state.section)")
            self?.tableView.reloadData()
        }
    }

    deinit {
        // Remove the listener
        subscription?.removeListener()
    }
    
    // MARK: - UITableView DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateSection.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
