//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Jerry Lu on 6/30/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            print("handle image")
        }
        
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
}
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            photoHelper.presentActionSheet(from: self)
            return false
        } else {
            return true
        }
    }
}
