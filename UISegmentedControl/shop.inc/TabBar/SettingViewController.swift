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
        //        var value = Int()
        //        for value in shoppingList {
        //             print(value)
        //        }
        print("tableView()-> Struct \(shoppingList.count)")
        //        return ShopList.shared.itemList.count
        print("tableView()-> Int \(shoppingList.count)")
        
        return shoppingList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cell , for: indexPath as IndexPath)
//        let shoppingList = ShopList.shared.itemList
//        if shoppingList.count == 1 {
//            print("doneTest")
//        } else if shoppingList.count >= 3 {
//            tableView.beginUpdates()
//        }
        
        //        for value in ShopList.shared.itemList {
        //            cell2.textLabel?.text = value.title[0]
        //            return cell2
        //        }
        
        //        if let visibleCells = tableView.indexPathsForVisibleRows {
        
        
        //            for cells in visibleCells {
        //                if let cell = tableView.cellForRow(at: cells) {
        //                    cell.textLabel?.text  = ShopList.shared.itemList[indexPath.row].title[0]
        //                }
        //            }
        //        }
        
        cell.textLabel?.text  = ShopList.shared.itemList[indexPath.row].title[0]
        
        tableView.beginUpdates()
        
        
        
//        if cell.count == 1 {
//            print("istn")
//        }
        
//        tableView.reloadData()
    
    //        MARK: Test property
    tableView.reloadSections(NSIndexSet(index:  0) as IndexSet, with: UITableView.RowAnimation.none)
    //        let indexPath = IndexPath(row:0, section:0)
    //        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
    tableView.endUpdates()
    print("tableView()-> Int \(cell)")
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        tableView.indexPathsForVisibleRows?.forEach({
//            if let cell = tableView.cellForRow(at: $0) as cell {
//                cell.confugite()
//            }
//        })
        
        let item : [ImageServers] = []
       
        
        
//        Refresh data
//        if editingStyle == .insert {
//            tableView.beginUpdates()
//            ShopList.shared.itemList.insert(contentsOf: item, at: indexPath.row)
////            myArray.remove(at: indexPath.row)
////            tableView.deleteRows(at: [indexPath], with: .fade )
////            tableView.insertRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        }
//
        if editingStyle == .delete {
            tableView.beginUpdates()
            ShopList.shared.itemList.remove(at: indexPath.row)
//            myArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade )
            tableView.endUpdates()
        }
    }

        
}

 

 
