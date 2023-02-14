//
//  UIViewEx.swift
//  UISegmentedControl
//
//  Created by atmo on 01.11.2022.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints =                             false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive =           true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive =   true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive =     true
    }

}
