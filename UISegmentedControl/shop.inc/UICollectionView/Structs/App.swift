//
//  App.swift
//  UISegmentedControl
//
//  Created by atmo on 23.02.2023.
//

import Foundation

struct App: Decodable, Hashable {

    let id: Int
    let tagline: String
    let name: String
    let subheading: String
    let image: String
    let iap: Bool
}

