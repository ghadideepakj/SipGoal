//
//  LandingPageVC.swift
//  Sip Goal
//
//  Created by Deepak Ghadi on 30/11/24.
//

import UIKit

@available(iOS 13.0, *)
class LandingPageVC: UITabBarController, UITabBarControllerDelegate {

    let centralButton = UIButton()

        override func viewDidLoad() {
            super.viewDidLoad()
            self.delegate = self

            // Assign the custom tab bar
            let customTabBar = CustomTabBar()
            self.setValue(customTabBar, forKey: "tabBar")

            setupViewControllers()
            setupCentralButton()
            
            self.selectedIndex = 2
        }

        private func setupViewControllers() {
            let achievementVC = UIViewController()
            achievementVC.view.backgroundColor = .white
            achievementVC.tabBarItem = UITabBarItem(title: "Achievement", image: UIImage(systemName: "trophy.fill"), tag: 0)

            let historyVC = UIViewController()
            historyVC.view.backgroundColor = .white
            historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "calendar"), tag: 1)

            let homeVC = UIViewController()
            homeVC.view.backgroundColor = .white
            homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 2)

            let helpVC = UIViewController()
            helpVC.view.backgroundColor = .white
            helpVC.tabBarItem = UITabBarItem(title: "Help", image: UIImage(systemName: "questionmark.circle"), tag: 3)

            let rateUsVC = UIViewController()
            rateUsVC.view.backgroundColor = .white
            rateUsVC.tabBarItem = UITabBarItem(title: "Rate Us", image: UIImage(systemName: "star.fill"), tag: 4)

            self.viewControllers = [achievementVC, historyVC, homeVC, helpVC, rateUsVC]
        }

        private func setupCentralButton() {
            centralButton.frame = CGRect(x: (tabBar.bounds.width / 2) - 30, y: -15, width: 60, height: 60)
            centralButton.layer.cornerRadius = 30
            centralButton.backgroundColor = .white
            centralButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
            centralButton.tintColor = .systemBlue
            centralButton.layer.shadowColor = UIColor.black.cgColor
            centralButton.layer.shadowOpacity = 0.2
            centralButton.layer.shadowOffset = CGSize(width: 0, height: 3)
            centralButton.layer.shadowRadius = 5

            centralButton.addTarget(self, action: #selector(centralButtonTapped), for: .touchUpInside)

            tabBar.addSubview(centralButton)
        }

        @objc private func centralButtonTapped() {
            self.selectedIndex = 2 // Navigate to the "Home" tab
        }
    

}
