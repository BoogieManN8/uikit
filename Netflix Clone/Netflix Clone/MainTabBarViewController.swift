//
//  ViewController.swift
//  Netflix Clone
//
//  Created by constantine Walker on 10.09.24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .green
        let vc1 = HomeViewController()
        let vc2 = UpComingViewController()
        let vc3 = SearchViewController()
        let vc4 = DownloadsViewController()

        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top search"
        vc4.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
    
}

