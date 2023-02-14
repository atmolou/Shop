//
//  SceneDelegate.swift
//  UISegmentedControl
//
//  Created by atmo on 18.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
 
        
    guard let window_Scene = (scene as? UIWindowScene) else { return }
        
        let VC = SplashAnimViewController()
        self.navigationController = UINavigationController(rootViewController: VC)
//
        self.window = UIWindow(windowScene: window_Scene)
        self.window?.rootViewController = self.navigationController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
         
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

