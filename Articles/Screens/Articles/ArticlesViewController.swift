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

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var subscription: Subscription<SerchSection>?
    var stateSection = [Section]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register the cell
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCellID")
        
        // Dispatch the Fetch Articles Async Action
        store.dispatch(action: FetchArticlesAsyncAction(url: Constants.baseUrl))

        // Add a listener to the store
        subscription = store.addListener(forStateType: SerchSection.self)  { [weak self] state in

            if state.section.isEmpty {
                
                self?.tableView.hideSpinnerInFooter()
            } else {
                
                // Update UI
                self?.stateSection.append(state.section)
                self?.tableView.reloadData()
            }
        }
    }

    deinit {
        // Remove the listener
        subscription?.removeListener()
    }
    
    // MARK: - UITableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stateSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateSection[section].articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCellID", for: indexPath) as! ArticleCell
        cell.configure(with: stateSection[indexPath.section].articles[indexPath.row])
        
        return cell
    }
    
    // MARK: - UITableView Delegate Methods
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        
        // If last cell, we load the next page
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
            
            self.tableView.showSpinnerInFooter()
            
            // Dispatch the Fetch Articles Async Action
            store.dispatch(action: FetchArticlesAsyncAction(url: stateSection[indexPath.section].nextPage ?? ""))
        }
    }
}
