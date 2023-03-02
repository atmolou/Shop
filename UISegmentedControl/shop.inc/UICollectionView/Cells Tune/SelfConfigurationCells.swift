//
//  SelfConfigurationCells.swift
//  UISegmentedControl
//
//  Created by atmo on 23.02.2023.
//

import Foundation


protocol SelfCConfigurationCell {
    static var reuseIdentifier: String { get }
    func configure(with app: App)
}
