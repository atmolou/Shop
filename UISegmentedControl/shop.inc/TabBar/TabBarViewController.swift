//
//  TabBarViewController.swift
//  UISegmentedControl
//
//  Created by atmo on 10.11.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Shop"
    
        view.backgroundColor = .blue
        generatTabBar()
        setTableAppear()
      
    }
    
    
    func titileINC() {
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Home_page"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
 
    private func generatTabBar() {
        viewControllers = [
            
        generateVC(viewContoller: SplashAnimViewController(),
                   title: "Home",
                   image: UIImage(systemName: "house.fill")),
        
        generateVC(viewContoller: InterfaceTestViewController(),
                   title: "Shoes",
                   image: UIImage(systemName: "list.bullet")),
        
        generateVC(viewContoller: SettingViewController(),
                   title: "Garbage=)",
                   image: UIImage(systemName: "trash.fill"))
        ]
    }

    
    private func generateVC(viewContoller : UIViewController, title : String, image :  UIImage?) -> UIViewController {
        viewContoller.tabBarItem.title = title
        viewContoller.tabBarItem.image = image
         
        return viewContoller

        
    }
    
    private func setTableAppear() {
        
        let onX : CGFloat = 10
        let onY : CGFloat = 14
        let width = tabBar.bounds.width - onX * 2
        let heigh = tabBar.bounds.height + onY * 2
        
        
        let roundLayer = CAShapeLayer()
        
        let dezierPath = UIBezierPath(
    roundedRect: CGRect(
        x: onX,
        y: tabBar.bounds.minY - onY,
        width: width,
        height: heigh),
    
        cornerRadius: heigh / 2
        )
        roundLayer.path = dezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight

    }
}
