//
//  Networking.swift
//  Articles
//
//  Created by Raed MEZRAOUI on 11/19/17.
//  Copyright © 2017 Raed MEZRAOUI. All rights reserved.
//

import Foundation
import UIKit

class Networking {
    
    class func sendRequest(url: URL, completionHandler:@escaping (Data?) -> ()) {
        
        UIApplication.showNetworkActivityIndicator()
        
        // Perform async request
        URLSession(configuration: .default).dataTask(with: url) { data, response, error in
            
            UIApplication.hideNetworkActivityIndicator()
            
            // When async request is done, dispatch actions
            completionHandler(data)
            
        }.resume()
    }
}
