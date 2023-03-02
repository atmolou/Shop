//
//  Decoder.swift
//  UISegmentedControl
//
//  Created by atmo on 23.02.2023.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file : String) -> T {
//        MARK: loading files
        guard let url = self.url(forResource: file, withExtension: nil)
        else {
            fatalError("Failed to locate \(file) in bundle!")
            
        }
//        MARK: Преобразование в экземпляр данных!!
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle!")
        }
        
        let decoder = JSONDecoder()
//        MARK: Декодирование 
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            
            fatalError("Failed to decode \(file) from bundle!")
        }
        return loaded
    }
}
