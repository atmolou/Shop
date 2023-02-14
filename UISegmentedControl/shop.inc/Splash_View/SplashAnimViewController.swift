//
//  SplashAnimViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 19.10.2022.
//
import CoreTelephony
import UIKit

class SplashAnimViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
 
    
     
    var arrivePicker : UIPickerView!
     var delegatePicker : UIPickerView!
     var timer = Timer()
     var myArr = [Int]()
     var modelData : [DateModel]!
 
    let buttonDone2 : UIButton = {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .black
        button.frame = CGRect(x: 50, y: 200, width: 20, height: 20)
        button.addTarget(self, action: #selector(handle), for: .allTouchEvents)
        return button
        
    }()
    
    let Buttons : UIButton = {
        let bT = UIButton(type: .system)
        bT.setTitle("Push", for: .normal)
        bT.addTarget(self, action: #selector(handleTo), for: .touchUpInside)
        return bT
    }()
    
    
    
  
    //Сколько компонентов надо вывести
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Сколько строк в компоненте
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return splashPickerMode.count
 
    }
 
    
    
    
    @objc func handle() {
        let Vc = TabBarViewController()
//        Vc.dataTR = self
//        Vc.okmov = tableField.text!
//        Vc.modalPresentationStyle = .fullScreen
        self.present(UINavigationController(rootViewController: Vc), animated: true, completion: nil)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    
        let model = splashPickerMode[row]
        
        
       return SplashStruct.create(titleSplashStruct: model.titleSplash)
        
 
    }
 
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if #available(iOS 14.0, *) {
            pickerView.subviews[1].backgroundColor = .clear
        }
        
    }

    
   
        func setup() {
                datePicker.delegate = self
      
                
                let countryCode: String
                if let carrier = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders?.first?.value,
                  
                    let code = carrier.isoCountryCode?.uppercased() {
                    countryCode = code
                } else {
                    countryCode = "RU"
                }
                
                let index = splashPickerMode.firstIndex { $0.code == countryCode } ?? 0
                datePicker.selectRow(index, inComponent: 0, animated: true)
                
                if #available(iOS 14.0, *) {
                    datePicker.subviews[1].backgroundColor = .clear
                }
   }

    
 
    private var splashPickerMode : [SplashPickerMode] = {
        
        var models: [SplashPickerMode] = []
        
        
        for (code, value) in DateModel.titile2 {
           
            models.append(.init(code: code, titleSplash: value.self)) //??? value.0
        
        }
     
        return models
        
    }()
 
    
    let testLabel: UILabel = {
       
       let label = UILabel()
       // label.text = "Test"
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    private var datePicker : UIPickerView = {
        
        let pickerr = UIPickerView()
        pickerr.translatesAutoresizingMaskIntoConstraints = false

        return pickerr
    }()
    
   
     
     
    func BlurrEffect2() {


        let blurEffect = UIBlurEffect(style: .systemMaterial)
        view.addSubview(blurView)
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
             blurView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
             blurView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            blurView.heightAnchor.constraint(equalToConstant: 160).isActive = true
            blurView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        }
    
    
    
    func pickerRolling () {

        
        for element in 0...10 {
            myArr.append(element)
        }

        timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(movePicker), userInfo: nil, repeats: true)
    }
 
    
    
    @objc func movePicker() {
        
        let pos = Int(arc4random_uniform(8)+1)
        
        datePicker.selectRow(pos, inComponent: 0, animated: true)
        datePicker.showsSelectionIndicator = true
        
        if pos == 5 || pos == 7 || pos == 3 {
            timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(movePicker), userInfo: nil, repeats: true)
        }
    }
    
    let blurChild =  BlurEffect()
    let splash_image = Splash_Image()
   
    
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        BlurrEffect2()
        
        setup()
  
        pickerRolling()
 
        datePicker.delegate = self
        datePicker.dataSource = self
        
      
        datePicker.tag = 1
        view.addSubview(datePicker)
//        splash_image.addTarget(self, action: #selector(handleTo), for: .allEditingEvents )
        
        view.addSubview(self.splash_image)
        view.addSubview(splash_image)
        
        view.addSubview(Buttons)
        view.addSubview(self.Buttons)
        
//        view.addSubview(buttonDone2)
        view.addSubview(blurChild)
        view.addSubview(testLabel)
        setuP()

    }

    }
   





extension SplashAnimViewController {
    
    func setuP() {
        self.Buttons.translatesAutoresizingMaskIntoConstraints = false
        self.splash_image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
 
            self.splash_image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -58  ),
            self.splash_image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            self.splash_image.widthAnchor.constraint(equalToConstant:  35),
            self.splash_image.heightAnchor.constraint(equalToConstant: 34),
            
            
            
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            datePicker.centerXAnchor.constraint(equalTo: vibrancyView.centerXAnchor, constant: 30),
            datePicker.centerYAnchor.constraint(equalTo: vibrancyView.centerYAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: 150),
            datePicker.heightAnchor.constraint(equalToConstant: 50),
            
            Buttons.centerYAnchor.constraint(equalTo: datePicker.centerYAnchor, constant: 50),
            Buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
     
            
        
        ])
    }
    @objc func handleTo() {
        let tabBar  = TabBarViewController()
//        tabBar.title  = "Welcome"
        
//        self.present(UINavigationController(rootViewController: tabBar), animated: true, completion: nil)
        let testPass = (UINavigationController(rootViewController: tabBar))
        testPass.modalPresentationStyle = .fullScreen
        present(testPass, animated: true)
        
       
    }
}


   

struct SplashPickerMode {
    
    let code: String
    let titleSplash : String
    
    

        
}

 



