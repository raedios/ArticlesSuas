//
//  UITableView+Extension.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import UIKit

extension UITableView {
    
    func showSpinnerInFooter() {
        
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.bounds.width, height: CGFloat(44))
        
        self.tableFooterView = spinner
        self.tableFooterView?.isHidden = false
    }
    
    func hideSpinnerInFooter() {
        
        self.tableFooterView?.isHidden = true
    }
}
