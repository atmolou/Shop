//
//  PersonalViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 10.11.2022.
//

import UIKit

protocol DataDelegate: class {
    func addData(data: String, connect : arrayViewForGrabage)
}



class PersonalViewController: UIViewController, DataDelegate {
    
    var dataDelegate: DataDelegate?

    func addData(data: String, connect: arrayViewForGrabage) {
        
        self.ArrayConnecter.append(connect)
        self.TableViewForGrabage.reloadData()
    }

    
    //SEGMENT
    var SegmentSwitch = UISegmentedControl()
    var segmnetSwitchColor = UISegmentedControl()
    var SegmentSize = UISegmentedControl()
    
    var imageArray = [UIImage(named: ""),UIImage(named: ""),UIImage(named: "")]
    //
    
    //Массив с InterfaceTestView
    public var ArrayConnecter = [arrayViewForGrabage]()
   
    var  TableViewForGrabage = UITableView()
    public var position : Int = 0
    public var trail: [ImageServers] = []
    
    // Массив с ImageInterface
    var identifire = 0
    lazy var item: ItemNO = Images.shoes4[identifire]
    
    public var imageForPersonal  = UIImageView()
    var testImage = UIImageView()
    //
    var TextLabelForDescription = UILabel()
    var TextLabelPrice = UILabel()
    var TextLabelSize = UILabel()
    //
    let personalSettings = PersonalUIViewSetting()
    
    lazy var  labelPrsonal : UILabel = {
        let labelPrsonal2 = UILabel()
        labelPrsonal2.textColor = UIColor.mainWhite
        labelPrsonal2.textAlignment = .center
        labelPrsonal2.text = "List"
        labelPrsonal2.font = UIFont.systemFont(ofSize: 20, weight:  .medium)
        
        return labelPrsonal2
    }()
    
    let ImageTitle : UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "shoes")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
 
    
    
    let buttonCart : UIButton = {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        button.tintColor = .systemBlue
               button.addTarget(self, action: #selector(handle), for: .touchUpInside)
        return button
        
    }()
    
    
    let buttonBuy : UIButton = {
        
        let button = UIButton(type: .system)

        button.setTitle("BUY IT NOW", for: .normal)
        
        button.tintColor = .white
        button.backgroundColor = .black
        
//               button.addTarget(self, action: #selector(handle), for: .touchUpInside)
        return button
        
    }()
    
    
    let textForBusket = UILabel()
    @objc func handle( sender : UIButton) {

// For pass data
    let test = trail[position]
 
       let VC = SettingViewController()
        ShopList.shared.add(test)
        
//        guard let varific = textField.text, textField.hasText else {
//            print("INSERT!!!")
//            return
//        }
                
        navigationController?.pushViewController(VC, animated: true)
    }
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Nameddd"
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
  
    func segmentColorAppear() {
        var menuArray = ["🔴", "🟣", "🟡"]
        var size = ["39","40","41","42","43","44", "45"]
        
        segmnetSwitchColor = UISegmentedControl(items: menuArray)
        segmnetSwitchColor.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmnetSwitchColor)
        
        
        segmnetSwitchColor.addTarget(self, action: #selector(SegmentColorSwitch), for: .valueChanged)
        segmnetSwitchColor.selectedSegmentIndex = 0
        
        self.segmnetSwitchColor.layer.borderWidth = 0.3
        self.segmnetSwitchColor.layer.cornerRadius = 3.0
        self.segmnetSwitchColor.layer.borderColor = UIColor.white.cgColor
     
        self.segmnetSwitchColor.layer.masksToBounds = true
        
        SegmentSwitch = UISegmentedControl(items: [size])
        SegmentSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.SegmentSwitch.layer.borderWidth = 0.0
        self.SegmentSwitch.layer.cornerRadius = 3.0
        self.SegmentSwitch.layer.borderColor = UIColor.white.cgColor
     
                                           
        
    }
    
    func segmentApper() {
     
        
        let image = trail[position]
    
//        let colorPickerForSegment = ["1", "2", "3", "3"]
        let unicodeArray = Array(repeating: "", count: image.imageItem.count)
        
        SegmentSwitch = UISegmentedControl(items: unicodeArray)
        SegmentSwitch.addTarget(self, action: #selector(segmentSwitch), for: .valueChanged)
        SegmentSwitch.selectedSegmentIndex = 0
        
        self.SegmentSwitch.layer.borderWidth = 0.3
        self.SegmentSwitch.layer.cornerRadius = 3.0
        self.SegmentSwitch.layer.borderColor = UIColor.white.cgColor
        self.SegmentSwitch.layer.masksToBounds = true
    }
    
    
    
    func confugite() {
        
        let image = trail[position]
//        imageForPersonal.layer.cornerRadius = 20.0
        
        imageForPersonal.clipsToBounds = true
        
        imageForPersonal.image = UIImage(named: image.imageItem[0])
//        imageForPersonal.cornerRaduis(corners: [.topRight], radius: 20)
        

        TextLabelForDescription.text = image.shortyDescription[0]
        TextLabelPrice.text = image.price[0]
        TextLabelSize.text = image.Size[0]
        
    }
    
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemYellow
        confugite()
        segmentApper()
        segmentColorAppear()
        self.navigationItem.titleView = labelPrsonal
        view.addSubview(imageForPersonal)
        setupView()
        view.addSubview(buttonCart)
    }
    
    private func craeteImageArray() -> [UIImage?] {
        let image = trail[position]
        var imageArray = [UIImage?]()
        for nameImage in image.imageItem {
            imageArray.append(UIImage(named: nameImage))
        }
        return imageArray
    }
    
    @objc func segmentSwitch(_ target: UISegmentedControl) {
        
        let indexImage = target.selectedSegmentIndex
        let imageArray = craeteImageArray()
        imageForPersonal.image = imageArray[indexImage]
        
        
    }
    
    @objc func SegmentColorSwitch (target : UISegmentedControl) {
        
        if target == segmnetSwitchColor{
            let segmentIndex = target.selectedSegmentIndex
            
            imageForPersonal.image = imageArray[segmentIndex]
            let pr =  target.titleForSegment(at: segmentIndex)
            
            print(pr ?? " ")
        }
        
    }
    
    

    ///personalView
    func setupView() {
        
        view.addSubview(self.buttonCart)
        view.addSubview(self.buttonBuy)
        view.addSubview(self.personalSettings)
        view.addSubview(self.TextLabelForDescription)
        view.addSubview(self.SegmentSwitch)
        view.addSubview(self.SegmentSize)
        view.addSubview(self.TextLabelPrice)
        view.addSubview(self.TextLabelSize)
        view.addSubview(self.textField)
        setLabelConstraints()
        
        
        view.addSubview(buttonCart)
        view.addSubview(buttonBuy)
        view.addSubview(personalSettings)
        view.addSubview(TextLabelForDescription)
        view.addSubview(TextLabelPrice)
        view.addSubview(TextLabelSize)
        view.addSubview(SegmentSwitch)
        view.addSubview(SegmentSize)
        view.addSubview(textField)
        
    }
  
}
    
    
    







extension PersonalViewController {
    
    func setLabelConstraints() {
        
        self.personalSettings.translatesAutoresizingMaskIntoConstraints = false
        self.imageForPersonal.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelForDescription.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelPrice.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelSize.translatesAutoresizingMaskIntoConstraints = false
        self.SegmentSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.buttonCart.translatesAutoresizingMaskIntoConstraints = false
        self.buttonBuy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.personalSettings.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -150),
            self.personalSettings.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150),
            
            self.imageForPersonal.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor, constant: -90),
            self.imageForPersonal.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.imageForPersonal.heightAnchor.constraint(equalToConstant: 390),
            
 
            self.TextLabelForDescription.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:  200),
            self.TextLabelForDescription.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.TextLabelPrice.topAnchor.constraint(equalTo: self.TextLabelForDescription.topAnchor, constant: 20),
            self.TextLabelPrice.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.TextLabelSize.topAnchor.constraint(equalTo: self.TextLabelPrice.topAnchor, constant: 20),
            self.TextLabelSize.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
            
            self.SegmentSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.SegmentSwitch.bottomAnchor.constraint(equalTo: self.imageForPersonal.bottomAnchor, constant: 0),
            self.SegmentSwitch.widthAnchor.constraint(equalToConstant: 400),
            self.SegmentSwitch.heightAnchor.constraint(equalToConstant: 15),
            
            
            self.segmnetSwitchColor.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -7),
            self.segmnetSwitchColor.bottomAnchor.constraint(equalTo: self.imageForPersonal.bottomAnchor, constant: 30),
            self.segmnetSwitchColor.widthAnchor.constraint(equalToConstant: 120),
            self.segmnetSwitchColor.heightAnchor.constraint(equalToConstant: 28),
            buttonCart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -150),
            buttonCart.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 350),
            buttonCart.widthAnchor.constraint(equalToConstant: 30),
            buttonCart.heightAnchor.constraint(equalToConstant: 30),
            
            
             
            buttonBuy.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 370),
            buttonBuy.widthAnchor.constraint(equalToConstant: 100),
           
            buttonBuy.widthAnchor.constraint(equalTo:  self.view.widthAnchor),
            
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: self.buttonCart.topAnchor),
            textField.widthAnchor.constraint(equalToConstant: 100),
            textField.heightAnchor.constraint(equalToConstant: 20),
            
         
        ])
    }
}

extension UIImageView {
    func cornerRaduis(corners: UIRectCorner, radius: CGFloat) {
//
        let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii:
                .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        
        mask.path = path.cgPath
        self.layer.mask = mask
        
    }
}

