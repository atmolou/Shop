//
//  ImageServer.swift
//  UISegmentedControl
//
//  Created by atmo on 03.11.2022.
//

import UIKit

struct ImageServers : Hashable {
 

    ///ImageServ
    var imageItem : [String]
    var name: String
    ///ImageServ
    var title: [String]
    var shortyDescription : [String]
    var price : [String]
    var Size : [String]
    SizeSelect : [Int]
    init(name: String, imageItem: [String], title: [String], shortyDescription: [String], price: [String], Size: [String],  SizeSelect : [Int]) {
        self.imageItem = imageItem
        self.name = name
        self.title = title
        self.shortyDescription = shortyDescription
        self.price = price
        self.Size = Size
        self.SizeSelect = SizeSelect
    }
        
}


struct ImageServers2 : Hashable {
 
//    var sturctAbove : [ImageServers] = []
//    
//    
//    mutating func add(_ add : ImageServers) {
//        sturctAbove.append(add)
//    }
    //ImageServ
    var imageItem : [String]
    
    ///ImageServ
    
    var title: [String]
    var shortyDescription : [String]
    var price : [String]
    var Size : [String]
    var SizeSelect : [Int]
    init(imageItem: [String], title: [String], shortyDescription: [String], price: [String], Size: [String],  SizeSelect : [Int]) {
        self.imageItem = imageItem
        self.title = title
        self.shortyDescription = shortyDescription
        self.price = price
        self.Size = Size
        self.SizeSelect = SizeSelect
    }
        
}





struct ItemsCollection : Hashable {
    
    static var collectionItems = [ ImageServers(name: "Nike Jordan violet", imageItem: ["nike_jordan_violet3","nike_jordan_violet1", "nike_jordan_violet2","nike_jordan_violet4","nike_jordan_violet5"],
        title: ["For walk 🚶"],
        shortyDescription: ["About of Nike Jordan_violet"],
        price: ["10€"], Size: ["Size 🕺"],
        SizeSelect: [37,38,39,40,41,42,43,44]),
                                   
        ImageServers(name: "Nike Jordan Orange", imageItem:
        ["nike_jordan_orange3", "nike_jordan_orange1",
        "nike_jordan_orange2", "nike_jordan_orange4",
        "nike_jordan_orange5", "nike_jordan_orange6"],
        title: ["For summer ☀️"],
        shortyDescription: ["About of Nike Jordan_orange"],
        price: ["11€"], Size: ["Size 🏝️🏜"],
        SizeSelect: [37,38,39,40,41,42,43,44]),
                                   
        ImageServers(name: "Nike Jordan Shadow", imageItem:
        ["nike-shadow_2", "nike-shadow_1","nike-shadow_3"],
        title: ["Workout & gym🏋️‍♀️"], shortyDescription: ["About of Nike Jordan_shadow"],
        price: ["12€"], Size: ["Size 💪"],
        SizeSelect: [37,38,39,40,41,42,43,44]),
                                   
        ImageServers(name: "Nike Jordan Shadow", imageItem:
        ["nike-kyrie_3", "nike-kyrie_1","nike-kyrie_2"],
        title: ["Winter ❄️"], shortyDescription: ["About of Nike Jordan_kerie"],
        price: ["13€"], Size: ["Size ☃️"],
        SizeSelect: [37,38,39,40,41,42,43,44]),
                                   
    ]
}

 



 

    
 
		
