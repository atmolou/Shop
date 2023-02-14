//
//  ImageInterface.swift
//  UISegmentedControl
//
//  Created by atmo on 30.10.2022.
//

import UIKit
import Foundation

struct Images {

    static var shoes4 = [
                            ItemNO(
                                imageItem: ["nike_jordan_violet1","nike_jordan_violet2","nike_jordan_violet3","nike_jordan_violet4","nike_jordan_violet5"],
                                
                                title: "Nike Jordan",
                                shortyDescription : "About of Nike Jordan_violet",
                                exstraDescription : "",
                                price: "10€"
//                                description
                            ),
                          ItemNO(imageItem: ["nike_jordan_orange1","nike_jordan_orange2",
                                             "nike_jordan_orange4", "nike_jordan_orange4",
                                             "nike_jordan_orange5", "nike_jordan_orange6"],
                                            title: "testDescr", shortyDescription : "About of Nike Jordan_orange", exstraDescription : "", price: ""),
                            
                          ItemNO(imageItem: ["nike-shadow_1","nike-shadow_3", "nike-shadow_3"],
                                 title: "testDescr", shortyDescription : "About of Nike Jordan_shadow", exstraDescription : "", price: " "),
                            
                          ItemNO(imageItem: ["nike-kyrie_1","nike-kyrie_2", "nike-kyrie_3"],
                                            title: "testDescr" ,shortyDescription : "About of Nike Jordan_kerie", exstraDescription : "", price: "")
    
]}


struct ItemNO: Hashable {
    var nameCollection: String
    var imageItem : [String]
    var title : String
    var shortyDescription : String
    var exstraDescription : String
    var price : String
    
    init(nameCollection: String = "d",imageItem: [String], title: String, shortyDescription: String,  exstraDescription: String, price: String) {
        self.nameCollection = nameCollection
        self.imageItem = imageItem
        self.title = title
        self.shortyDescription = shortyDescription
        self.exstraDescription = exstraDescription
        self.price = price
    }
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Новую структуру для показа  В PersonalController нужно будет или Имплементировать в структуру выше ну крч нужно фастом сделать это все
    struct CollectionItems {
        
        static var bla_bla = [
            Item(
                articleNumber: "304.545.46",
                price: 2499,
                imageItem: ["lamp1","lamp2","lamp3","lamp4","lamp5"],
                shortDescription: "Настольная лампа с зажимом, нержавеющ сталь",
                description: "У этой с виду обычной настольной лампы есть несколько скрытых преимуществ. Ее можно закрепить как на горизонтальной, так и на вертикальной поверхности, ее высота регулируется, а свет можно направить в любую сторону."),
            Item(
                articleNumber: "704.545.06",
                price: 4999,
                imageItem: ["shelf1","shelf2","shelf3","shelf4"],
                shortDescription: "Стеллаж на колесиках, дубовый шпон, 34x69 см",
                description: "Этот стеллаж легко перемещать по дому, а когда нужно освободить место, просто задвигать под стол. Его можно использовать как дополнительную рабочую поверхность или удобную тумбу рядом с диваном или креслом."),
            Item(
                articleNumber: "904.546.52",
                price: 2499,
                imageItem: ["boxChest1","boxChest2","boxChest3","boxChest4","boxChest5"],
                shortDescription: "Ящик-сундук, березовая фанера, 36x18x31 см",
                description: "Эта прочная коробка продается в плоской упаковке, которую легко донести до дома. Поверхность не обработана, поэтому вы можете покрыть ее маслом, воском, лаком или покрасить в свой любимый цвет, прежде чем наполнять ее вещами."),
            Item(
                articleNumber: "004.545.24",
                price: 13999,
                imageItem: ["diningTable1","diningTable2","diningTable3","diningTable4","diningTable5"],
                shortDescription: "Стол обеденный, дубовый шпон, 130x78 см",
                description: "Столы РОВАРОР из натурального дерева подойдут к интерьеру любого стиля. Также вам не составит труда подобрать к ним стулья. Столы легко собрать и разобрать, а также комбинировать, ведь все они имеют одинаковую высоту и ширину или длину.")
        ]
        
        
        
        struct Item: Hashable {
            var nameCollection: String
            var articleNumber: String
            var price: Int
            var imageItem: [String]
            var shortDescription: String
            var description: String
            
            
            init(nameCollection: String = "RÅVAROR РОВАРОР", articleNumber: String, price: Int, imageItem: [String], shortDescription: String, description: String) {
                self.nameCollection = nameCollection
                self.articleNumber = articleNumber
                self.price = price
                self.imageItem = imageItem
                self.shortDescription = shortDescription
                self.description = description
            }
        }
    }
    
}
