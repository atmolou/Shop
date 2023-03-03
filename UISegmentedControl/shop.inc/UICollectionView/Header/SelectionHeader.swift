//
//  SelectionHeader.swift
//  UISegmentedControl
//
//  Created by user on 03.03.2023.
//

import UIKit

class SelectionHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeader"
    
    let title = UILabel()
    let subtitle = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        line separator
        
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel
        
        title.textColor = .label
        title.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        
        subtitle.textColor = .secondaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [separator, title, subtitle])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
        
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            
        
        ])
//        ????
        stackView.setCustomSpacing(10, after: separator)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard tryinh to make storyboard happen")
    }
    
}
