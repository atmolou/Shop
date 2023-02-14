//
//  SplashStruct.swift
//  UISegmentedControl
//
//  Created by atmo on 21.10.2022.
//

import UIKit

 

final class SplashStruct : UIView {
    
    static func create (titleSplashStruct : String) -> SplashStruct {
        let numberView = SplashStruct()
        numberView.label.text = titleSplashStruct
        
        return numberView
    }

    

    private let label = UILabel()
    private let labelSecound = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
    }


    private func setup() {


        addSubview(label)
        
        NSLayoutConstraint.activate([
            
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

        label.translatesAutoresizingMaskIntoConstraints = false
        


        label.textColor = .black
        label.font  = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left



    }
    

}
