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
    lazy var item: ImageServers = ItemsCollection.collectionItems[identifire]
    
    public var imageForPersonal  = UIImageView()
    var testImage = UIImageView()
    //LABLES
    var TextLabelForDescription = UILabel()
    var TextLabelPrice = UILabel()
    var TextLabelSize = UILabel()
    var TextLabelName = UILabel()
    let personalSettings = PersonalUIViewSetting()
    //
   
    
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
    
//    let textField: UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "Full Nameddd"
//        tf.textAlignment = .center
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
  
    func segmentColorAppear() {
        var menuArray = ["🔴", "🟣", "🟡"]
       
        
        segmnetSwitchColor = UISegmentedControl(items: menuArray)
        segmnetSwitchColor.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmnetSwitchColor)
        
        
        segmnetSwitchColor.addTarget(self, action: #selector(SegmentColorSwitch), for: .valueChanged)
        segmnetSwitchColor.selectedSegmentIndex = 0
        
        self.segmnetSwitchColor.layer.borderWidth = 0.3
        self.segmnetSwitchColor.layer.cornerRadius = 3.0
        self.segmnetSwitchColor.layer.borderColor = UIColor.white.cgColor
     
        self.segmnetSwitchColor.layer.masksToBounds = true
        
     
     
                                           
        
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
        
//        let s = image.SizeSelect
//        let indexPath = SegmentSize.selectedSegmentIndex
//        var word = String()
//        var arrays = textSelector()
//        var sayHello = 0
//        var size2 = String()
//        s.forEach { word in
//             word
//        }
//        for size2 in image.SizeSelect {
//            word.append(size2)
//            sayHello += 1
//        }
//        MARK: ???????
//        let testCount = image.SizeSelect.count
        
        
        
//        let sizeModif = Array(repeating: "", count: image.SizeSelect.count)
        var size = ["37","38","39","40","41","42","43","44"]
        SegmentSize = UISegmentedControl(items: size)
        SegmentSize.layer.borderColor = UIColor.clear.cgColor
        SegmentSize.layer.borderWidth = 0.0
//        MARK: - Make select in Addtarget
        SegmentSize.addTarget(self, action: #selector(handleSize), for: .valueChanged)
        SegmentSize.clipsToBounds = true
        SegmentSize.layer.masksToBounds = true
        
       
        
    
        
        
        
        
    }
    
    
    
    func confugite() {
        
        let image = trail[position]
//        imageForPersonal.layer.cornerRadius = 20.0
        
        imageForPersonal.clipsToBounds = true
        
        imageForPersonal.image = UIImage(named: image.imageItem[0])
//        imageForPersonal.cornerRaduis(corners: [.topRight], radius: 20)
        

//        TextLabelForDescription.text = image.shortyDescription[0]
        TextLabelPrice.text = "Price: \(image.price[0])"
        TextLabelPrice.font = UIFont.systemFont(ofSize: 15, weight: .light)
        TextLabelSize.text = image.Size[0]
        TextLabelSize.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        TextLabelName.text = image.name
        
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
    
    private func craeteImageArray() -> [UIImage?]  {
        let image = trail[position]
        var imageArray = [UIImage?]()
        for nameImage in image.imageItem {
            imageArray.append(UIImage(named: nameImage))
        }
        return imageArray
    }
    
    private func textSelector() -> [String?] {
        let text = trail[position]
        var textArray = [String?]()
        
        for size in text.SizeSelect {
            textArray.append(size)
        }
        return textArray
    }
    
    @objc func segmentSwitch(_ target: UISegmentedControl) {
        
        let indexImage = target.selectedSegmentIndex
        let imageArray = craeteImageArray()
        imageForPersonal.image = imageArray[indexImage]
        
        
    }
    
    @objc func handleSize(segment : UISegmentedControl) {
        let image = trail[position]
            let index = segment.selectedSegmentIndex
            let arrays = textSelector()
        
        TextLabelSize.text = arrays[index]
        
//                let sizeModif = Array(repeating: arrays[index], count: image.SizeSelect.count)
            
//        let sizeMod = UISegmentedControl(items: sizeModif as [Any])
         
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
//        view.addSubview(self.textField)
        view.addSubview(self.TextLabelName)
        setLabelConstraints()
        
        
        view.addSubview(buttonCart)
        view.addSubview(buttonBuy)
        view.addSubview(personalSettings)
        view.addSubview(TextLabelForDescription)
        view.addSubview(TextLabelPrice)
        view.addSubview(TextLabelSize)
        view.addSubview(SegmentSwitch)
        view.addSubview(SegmentSize)
//        view.addSubview(textField)
        view.addSubview(TextLabelName)
        
    }
  
}
    
    
    







extension PersonalViewController {
    
    func setLabelConstraints() {
        
        self.personalSettings.translatesAutoresizingMaskIntoConstraints = false
        self.imageForPersonal.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelForDescription.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelPrice.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelSize.translatesAutoresizingMaskIntoConstraints = false
        self.TextLabelName.translatesAutoresizingMaskIntoConstraints = false
        self.SegmentSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.SegmentSize.translatesAutoresizingMaskIntoConstraints = false
        self.buttonCart.translatesAutoresizingMaskIntoConstraints = false
        self.buttonBuy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.imageForPersonal.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor, constant: -90),
            self.imageForPersonal.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.imageForPersonal.heightAnchor.constraint(equalToConstant: 390),
            
 
            self.TextLabelForDescription.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:  200),
            self.TextLabelForDescription.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.TextLabelPrice.topAnchor.constraint(equalTo: self.personalSettings.topAnchor, constant: 0),
            self.TextLabelPrice.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            self.TextLabelSize.topAnchor.constraint(equalTo: self.SegmentSize.topAnchor, constant: -35),
            self.TextLabelSize.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            
            self.SegmentSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.SegmentSwitch.bottomAnchor.constraint(equalTo: self.imageForPersonal.bottomAnchor, constant: 0),
            self.SegmentSwitch.widthAnchor.constraint(equalToConstant: 400),
            self.SegmentSwitch.heightAnchor.constraint(equalToConstant: 15),
            
            self.SegmentSize.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.SegmentSize.bottomAnchor.constraint(equalTo: self.imageForPersonal.bottomAnchor, constant: 160),
            self.SegmentSize.widthAnchor.constraint(equalToConstant: 400),
            self.SegmentSize.heightAnchor.constraint(equalToConstant: 30),
            
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
            
            TextLabelName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            TextLabelName.bottomAnchor.constraint(equalTo: self.imageForPersonal.bottomAnchor, constant: 45),
            TextLabelName.widthAnchor.constraint(equalToConstant: 150),
            TextLabelName.heightAnchor.constraint(equalToConstant: 22),
            
            self.personalSettings.leftAnchor.constraint(equalTo: self.TextLabelPrice.leftAnchor, constant: 80),
//            self.personalSettings.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150),
            
            self.personalSettings.bottomAnchor.constraint(equalTo: self.imageForPersonal.bottomAnchor, constant: 70),
            self.personalSettings.widthAnchor.constraint(equalToConstant: 150),
            self.personalSettings.heightAnchor.constraint(equalToConstant: 10),
            

            
         
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

