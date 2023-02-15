//
//  PersonalUIViewSetting.swift
//  UISegmentedControl
//
//  Created by atmo on 22.11.2022.
//

import UIKit

class PersonalUIViewSetting: UIView {


    let titleTest : UILabel = {
        
        let label = UILabel()
        label.text = "Men's originals"
        label.font = UIFont.systemFont(ofSize: 14, weight:  .light)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
//        setImageConstraints()
     }
    
    func setupImage() {
        
       // addSubview(testImage)
      setImageConstraints()
//  addSubview(titleTest)
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	
}

 


extension PersonalUIViewSetting {

    
    
    
    func setImageConstraints() {
        // Если вылетает ошибка NSanchorY то нужно первый экземляр обозначать именно как ниже |||
        self.addSubview(self.titleTest)
        self.titleTest.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
          
//            self.titleTest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
//            self.titleTest.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            self.titleTest.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//
//            self.titleTest.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
//            testImage.centerXAnchor.constraint(equalTo: centerXAnchor),
//            testImage.centerYAnchor.constraint(equalTo: centerYAnchor),
//            testImage.widthAnchor.constraint(equalToConstant: 100),
//            testImage.heightAnchor.constraint(equalToConstant: 100),
//            titleTest.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            titleTest.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)

        ])
        
        
        //      imageP.frame = CGRect(x: 135, y: 445.5, width: 35, height: 35)
}

    
    
}
