//
//  ShopList.swift
//  UISegmentedControl
//
//  Created by atmo on 21.12.2022.
//

import Foundation


struct ShopList {
    static var shared = ShopList()
    var itemList : [ImageServers] = []

    mutating func add(_ item : ImageServers) {
        itemList.append(item)
    }

    mutating func remove(_ item : ImageServers) {
        itemList.append(item)
    }
}

