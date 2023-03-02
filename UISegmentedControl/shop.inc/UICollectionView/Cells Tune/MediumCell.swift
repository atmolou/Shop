//
//  MediumCell.swift
//  UISegmentedControl
//
//  Created by user on 02.03.2023.
//

import UIKit

class MediumCell: UICollectionViewCell, SelfCConfigurationCell {
    static var reuseIdentifier:  String = "mediumTable"
    
    
    let name = UILabel()
    let subtitle = UILabel()
    let imageViewsss = UIImageView()
    let buyButton = UIButton(type: .custom)
    

    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        name.font = UIFont.preferredFont(forTextStyle: .headline)
        name.textColor = .label
        
        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitle.textColor = .secondaryLabel
        
        imageViewsss.layer.cornerRadius = 15
        imageViewsss.clipsToBounds = true
        
        buyButton.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
        
        let innerStack = UIStackView(arrangedSubviews: [name, subtitle])
        innerStack.axis = .vertical
        
        let outStackView = UIStackView(arrangedSubviews: [imageViewsss, innerStack, buyButton])
        outStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(outStackView)
        
        NSLayoutConstraint.activate([
        
            outStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
             
            
            ])

        
    }
    
    
        func configure(with app: App) {
        
        name.text  = app.name
        subtitle.text = app.subheading
//        imageViewsss.image = UIImage(named: app.image)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Just - NO")
    }
    

    
    
    
    
    

    
    
    
}
