//
//  InterfaceCells.swift
//  UISegmentedControl
//
//  Created by atmo on 04.11.2022.
//

import UIKit

class InterfaceCells: UITableViewCell {

    public var pos : Int = 0
    
        var interfaceImageView = UIImageView()
        var intefaceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(interfaceImageView)
        addSubview(intefaceLabel)
        
        configureImageView()
        configureTitileLabel()
        
        setImageConstraints()
        setTitleConstraints()
        
        setCustomizeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(image : ImageServers) {
        //         let image2 = traill[0]
        ///Dont work For each statement
//        for value  in Images.shoes4 {
//
//        interfaceImageView.image = UIImage(named: value.imageItem[0])
//        }

        ///work =)
        interfaceImageView.image = UIImage(named: image.imageItem[0])
        intefaceLabel.text = image.title[0]
        intefaceLabel.font = UIFont(name: "Helvetica" , size: 16)
       
    }
    
    
    
    func configureImageView() {
        interfaceImageView.layer.cornerRadius = 9
        interfaceImageView.clipsToBounds = true
        
    }
    
    func configureTitileLabel() {
      
        intefaceLabel.numberOfLines = 0 //2
        intefaceLabel.adjustsFontSizeToFitWidth = true
        
        
    }
    func setImageConstraints() {
        
        
        interfaceImageView.translatesAutoresizingMaskIntoConstraints =   false
        interfaceImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive =  true
        //videoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        interfaceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        interfaceImageView.heightAnchor.constraint(equalToConstant:  73).isActive =  true
        interfaceImageView.widthAnchor.constraint(equalTo: interfaceImageView.heightAnchor, multiplier: 2/1.7).isActive = true
    }
    
    
    
    func setTitleConstraints() {
        intefaceLabel.translatesAutoresizingMaskIntoConstraints = false
        intefaceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        intefaceLabel.leadingAnchor.constraint(equalTo:  centerXAnchor ).isActive = true
        intefaceLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        intefaceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
    
    func setCustomizeLabel() {
        
        intefaceLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
        
    }
    
    
    func forChevron() {
        let chev = UIImage(named: "chevron.right")
        
    }
    
}


