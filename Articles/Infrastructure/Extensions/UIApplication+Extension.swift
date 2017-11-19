//
//  UIApplication+Extension.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func showNetworkActivityIndicator() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    class func hideNetworkActivityIndicator() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
