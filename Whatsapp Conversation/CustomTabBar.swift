//
//  CustomTabBar.swift
//  WhatsApp
//
//  Created by Edward Pizzurro Fortun on 4/27/19.
//  Copyright © 2019 Pencil. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        let primerVC = UINavigationController(rootViewController: PrincipalController())
        primerVC.tabBarItem.image = UIImage(named: "people")
        primerVC.tabBarItem.title = "Chats"
        
        let segundoVC = UINavigationController(rootViewController: PrincipalController())
        segundoVC.tabBarItem.image = UIImage(named: "calls")
        segundoVC.tabBarItem.title = "Llamadas"
        
        viewControllers = [primerVC, segundoVC]
    }
}
