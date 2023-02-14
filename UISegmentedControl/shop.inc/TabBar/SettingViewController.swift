//
//  SettingViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 10.11.2022.
//

import UIKit

struct arrayViewForGrabage {
    var array : String
    var ArrayConnecter = [arrayViewForGrabage]()
    var  tableViewForGrabage = UITableView()
    
    init(array: String) {
        self.array = array
    }
    mutating func addData(data: String, connect: arrayViewForGrabage) {
//        self.data = data
     ArrayConnecter.append(connect)
        tableViewForGrabage.reloadData()
    }
}


class SettingViewController: UIViewController, DataDelegate   {
    

  func addData(data: String, connect: arrayViewForGrabage) {

        self.ArrayConnecter.append(connect)
        self.tableViewForGrabage.reloadData()
    }
    
  
    
    weak var delegate: DataDelegate?
    public var position2 : Int = 0
    public var trail2: [ImageServers] = []
    public var dateBase : [ItemNO] = []
    public var dateBase2 = [ItemNO]()
    
    
    var labrlForPrice = UILabel()
    var labrlForPrice222 = UILabel()
    
    
    var origController : PersonalViewController?
    
    
    var cellGarbage = "cell"
    
    // For Connect DELEATEEEEEEEEEEÈ
    var okmov = ""
    
    //    var ArrayTest = [""]
    var  tableViewForGrabage = UITableView()
    
    var ArrayConnecter = [arrayViewForGrabage]()
    
    var cell = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
     
        setupView()
        table()
    }
    

    
    
    @objc func handle () {
        let Vc2 = PersonalViewController()
        self.present(UINavigationController(rootViewController: Vc2), animated: true, completion: nil)
    }
    
    func setupView() {
        tableViewForGrabage.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableViewForGrabage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewForGrabage)
        view.addSubview(self.tableViewForGrabage)
        tableViewForGrabage.delegate = self
        tableViewForGrabage.dataSource = self
        
    }
    
    
    func table() {
        NSLayoutConstraint.activate([
    
            tableViewForGrabage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableViewForGrabage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableViewForGrabage.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableViewForGrabage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
        

    }
 
 
  
    func addData (add : arrayViewForGrabage) {
        
        self.ArrayConnecter.append(add)
        self.tableViewForGrabage.reloadData()
    }
    
}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ArrayConnecter.count
        let shoppingList = ShopList.shared.itemList
//        return ShopList.shared.itemList.count
        return shoppingList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: cell , for: indexPath as IndexPath)
        
        for value in ShopList.shared.itemList {
            cell2.textLabel?.text = value.title[0]
            return cell2
        }
    
        
        return cell2
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            ShopList.shared.itemList.remove(at: indexPath.row)
//            myArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade )
            tableView.endUpdates()
        }
    }

        
}

 

 
