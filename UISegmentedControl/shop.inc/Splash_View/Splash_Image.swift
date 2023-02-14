//
//  Splash_Image.swift
//  UISegmentedControl
//
//  Created by atmo on 29.10.2022.
//

import UIKit

class Splash_Image: UIView {
    
    
    private var selectedImage : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        imageView.tintColor = .black
       
        
        // imageView.setBackgroundImage(UIImage(named: "arrowtriangle.forward.circle.fill"), for: UIControl.State.normal)
        imageView.image = UIImage(systemName: "arrowtriangle.forward.circle.fill")
         
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView () {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(selectedImage)
        
        
    }
    
    
//MARK: -@obcj
    
  
   
}
extension Splash_Image {
    
    
    
    func setConstraints() {
        
        

        
        self.addSubview(self.selectedImage)
        self.selectedImage.translatesAutoresizingMaskIntoConstraints = false
        
               NSLayoutConstraint.activate([
        
                self.selectedImage.widthAnchor.constraint(equalToConstant:  35),
                self.selectedImage.heightAnchor.constraint(equalToConstant: 34)

        
                ])
        
    }
    
    
    
}
