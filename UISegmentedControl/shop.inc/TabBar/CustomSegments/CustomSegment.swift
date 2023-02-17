//
//  CustomSegment.swift
//  UISegmentedControl
//
//  Created by user on 16.02.2023.
//

import UIKit

class CustomSegment: UIView {

    private var buttonTitiles: [String]!
    private var button: [UIButton] = []
    private var selectrView : UIView!
    
    
    
    var textColor: UIColor = .black
    var selectorViewColor: UIColor = .red
    var selectorTextColor: UIColor = .red
     
    
    private func configStackView() {
        
        let stack = UIStackView(arrangedSubviews: button)
        
        stack.axis = .horizontal
        stack.alignment = .fill
        
    }
    
    

}
