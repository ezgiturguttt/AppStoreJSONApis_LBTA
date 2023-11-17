//
//  BaseTabBarController.swift
//  AppStoreJSONApisET
//
//  Created by Ezgı Mac on 26.04.2023.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // bolum2:  1- create Today controller
    // 2-refactor our repeated logic indside of viewDidLoad
    // 3-maybe introduce our AppsSearchController
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        viewControllers = [
            /*3.asama appsearch... */
            createNavController(viewController: TodayController(), title: "Today", imageName: "today"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: MusicController(), title: "Music", imageName: "music")
        ]
    }
    //2-
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.tabBarItem.title = title
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return navController
        
    }
}
