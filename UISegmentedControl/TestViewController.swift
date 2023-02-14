//
//  TestViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 24.10.2022.
//

import UIKit

class TestViewController: UIViewController {
    
    var pickerType : UIPickerView = {
        
       let picker = UIPickerView()
        picker.frame = CGRect(x: 50, y: 0, width: 150, height: 150)
        
        return picker
        
    }()
    
    
    let testImage : UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "shoes")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    let titleTest : UILabel = {
        
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont(name: "", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    var pickerType2 : UIPickerView = {
       
        let picker = UIPickerView()
         picker.frame = CGRect(x: 250, y: 200, width: 150, height: 150)
         
         return picker
         
     }()
        
    
    private let label = UILabel()
    
    
    
    var type = ["Shop", "Покупай", ""]
     
    let type2 = ["everywhe.", "by Atmo"]
    
    func customm () {
       
    }

     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
       
        
        pickerType.dataSource = self
        pickerType.delegate = self
        view.addSubview(pickerType)
        
        pickerType2.dataSource = self
        pickerType2.delegate = self
        view.addSubview(pickerType2)
        
        pickerType.tag = 1
        pickerType2.tag = 2
        setupView()
        
    }
    
  
    func setupView() {
        view.addSubview(titleTest)
        
        setConstr()
        
    }
    
     

}
extension TestViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerType == pickerType { return type.count}
        if pickerType2 == pickerType2 { return type2.count}
        return 0
        
     
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerType == pickerType { return type[row]}
        if pickerType2 == pickerType2 { return type2[row]}
        
        return ""
}
    
    
     
}

extension TestViewController {
    

    
    func setConstr() {
        NSLayoutConstraint.activate([
        
            titleTest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTest.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ])
    }
}
