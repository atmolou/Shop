//
//  InterfaceTestViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 04.11.2022.
//

import UIKit

class InterfaceTestViewController: UIViewController {
    
    struct Cells {
        static let imageCell = "InterfaceCells"
    }
    
    
    var tableView = UITableView()
    var imagess = [ImageServers]()
    var data = ItemsCollection.collectionItems
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        titileINC()
//
        imagess = data
        
        configurateTableView()

    }
    
    
    func titileINC() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Shoes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configurateTableView() {
        
        view.addSubview(tableView)
        
        //set DELEGATES
        tableView.delegate = self
        tableView.dataSource = self
        //set row height
        tableView.rowHeight = 75
        //rgister cells
        tableView.register(InterfaceCells.self, forCellReuseIdentifier: Cells.imageCell)
        //set const
        tableView.pin(to: view)
        
    }
    
    @objc func nextView(_ sender: UIButton) {
        
        let nextVC = PersonalViewController()
        nextVC.position = sender.tag
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}


    
extension InterfaceTestViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagess.count
    }
    
    // TABLE CONNECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let  position = indexPath.row
        
        let nextVC = PersonalViewController()
        nextVC.position = position
        nextVC.trail = imagess
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.imageCell) as! InterfaceCells
        
        let image = imagess[indexPath.row]
        
        cell.set(image: image)
        
        let chev = UIImage(named: "chevron.right")
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView = UIImageView(image: chev)
        cell.textLabel?.font = UIFont(name: "Helvetica" , size: 10)
        
        return cell
        
    }
}
