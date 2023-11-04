//
//  TabBarController.swift
//  HealthStatus
//
//  Created by testing on 01.11.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            if let navigationVC = viewController as? UINavigationController {
                if navigationVC.topViewController is AuthorsTableViewController { return
                } else if viewController is HealthSurveyViewController { return
                }
            }
        }
    }
}
