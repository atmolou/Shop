//
//  InterFaceViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 19.10.2022.
//

import UIKit

class InterFaceViewController: UIViewController {

    var tableView = UITableView()
    var imagesInterface : [ImageServers] = []
    
    struct Cells {
          static let imageCells = "InterfaceCell"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Shoes"
       configureTableView()
 
        
    }
    

    
   
    
    func configureTableView(){
        
        view.addSubview(tableView)
            
            setTableView()
            tableView.rowHeight = 75
            //register cells
        tableView.register(InterfaceCells.self, forCellReuseIdentifier: Cells.imageCells)
            //set constraints
            tableView.pin(to: view)
        
    }
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}




extension InterFaceViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesInterface.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.imageCells) as! InterfaceCells
        
        return UITableViewCell()
    }
    
    
    
    
    
}


