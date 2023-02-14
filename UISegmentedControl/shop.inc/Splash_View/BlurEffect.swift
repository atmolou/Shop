//
//  BlurEffect.swift
//  UISegmentedControl
//
//  Created by atmo on 24.10.2022.
//

import UIKit

class BlurEffect : UIView { /// DONT WORK
    
//    let blurView: UIVisualEffectView = {
//       let view = UIVisualEffectView()
//        view.layer.cornerRadius = 20
//        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    let vibrancyView: UIVisualEffectView = {
//       let view = UIVisualEffectView()
//        view.layer.cornerRadius = 20
//        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//
//    fileprivate func setupVibrancyView() {
//        vibrancyView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
//        vibrancyView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor).isActive = true
//        vibrancyView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        vibrancyView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//    }
//
//    fileprivate func setupBlurView() {
//
//        blurView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        blurView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//    }
//
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//
       // BlurrEffect()
             
     
         
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func BlurrEffect() {
        
       
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        addSubview(blurView)
        blurView.effect = blurEffect
        setupBlurView()
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect, style: .secondaryLabel)
        vibrancyView.effect = vibrancyEffect
        blurView.contentView.addSubview(vibrancyView)
        setupVibrancyView()
        
        
     
         
    }
        
        let blurView: UIVisualEffectView = {
           let view = UIVisualEffectView()
            view.layer.cornerRadius = 8
            view.clipsToBounds = true
             view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let vibrancyView: UIVisualEffectView = {
           let view = UIVisualEffectView()
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
             view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        
         func setupVibrancyView() {
            
            vibrancyView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
             vibrancyView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor).isActive = true
            vibrancyView.heightAnchor.constraint(equalToConstant: 160).isActive = true
            vibrancyView.widthAnchor.constraint(equalToConstant: 200).isActive = true
             
        }
        
         func setupBlurView() {
             blurView.centerXAnchor.constraint(equalTo:  centerXAnchor).isActive = true
             blurView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            blurView.heightAnchor.constraint(equalToConstant: 160).isActive = true
            blurView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        }
    

    
}



