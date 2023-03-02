//
//  Selection.swift
//  UISegmentedControl
//
//  Created by atmo on 23.02.2023.
//

import UIKit
 
    
    
struct Selection : Decodable, Hashable {
   
        let id : Int
        let type: String
        let title: String
        let subtitle: String
        let items : [App]
    }
 
