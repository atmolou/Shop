//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 18.10.2022.
//

import UIKit

class ViewController: UIViewController {

    var SegmentControl = UISegmentedControl()
    var imageView = UIImageView()
    
    var menuArray = ["🔴", "🟣", "🟡"]
    
    var imageArray = [UIImage(named: "shoes"),
                      UIImage(named: "shoes2"),
                      UIImage(named: "shoes3")]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //image
        
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 200,
                                 height: 200)
        imageView.center = view.center
        imageView.image = self.imageArray[0]
        view.addSubview(imageView)
        
        
        //create
        SegmentControl = UISegmentedControl(items: menuArray)
        SegmentControl.frame = CGRect(x: 115, y: 650, width: 200, height: 30)
        view.addSubview(SegmentControl)
         
        
        SegmentControl.addTarget(self, action: #selector(selectValue), for: .valueChanged)
        
        
    }

     
    
    @objc func selectValue(target : UISegmentedControl) {
        
        if target == SegmentControl{
            let segmentIndex = target.selectedSegmentIndex
            
            imageView.image = imageArray[segmentIndex]
           let pr =  target.titleForSegment(at: segmentIndex)
            
            print(pr ?? " ")
        }

        
    }

}

