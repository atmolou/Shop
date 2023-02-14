//
//  SplashStruct2.swift
//  UISegmentedControl
//
//  Created by atmo on 24.10.2022.
//

import UIKit

final class SplashStruct2 : UIView {
    static func create2 (titleSplashStruct2 : String) -> SplashStruct2 {
        let numberViewSecound = SplashStruct2()
        numberViewSecound.labelSecound.text = titleSplashStruct2

        return numberViewSecound
    }
    
    
    private let labelSecound = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup2()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup2()
        
    }
    
    
    private func setup2() {


       
        addSubview(labelSecound)
  //      addSubview()
        
        NSLayoutConstraint.activate([

            labelSecound.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            labelSecound.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelSecound.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])


        labelSecound.translatesAutoresizingMaskIntoConstraints = false

        labelSecound.textColor = .black
        labelSecound.font  = UIFont.systemFont(ofSize: 16.5)
        labelSecound.textAlignment = .left




    }
    
}
