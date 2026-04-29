//
//  NetworkClient.swift
//  Chew_Task020
//
//  Created by Student on 3/26/26.
//

import Foundation
import SwiftUI

@Observable
class NetworkClient{
    func getDishFromName(name: String){
        let urlStr = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(name)"
        
        guard let url = URL(string: urlStr) else { return }

    }
    
}
