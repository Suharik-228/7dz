//
//  LoginInspector.swift
//  Navigation
//
//  Created by Suharik on 02.06.2022.
//

import UIKit

final class Factory {
    
    enum State {
        case feed
        case profile
    }
    
    let navigationController: UINavigationController
    let state: State
    
    init(
        navigationController: UINavigationController,
        state: State
    ) {
        self.navigationController = navigationController
        self.state = state
        startModule()
    }
    
    func startModule() {
        switch state {
        case .feed:
            let coordinator = FeedCoordinator()
            let feedViewController = coordinator.showDetail(coordinator: coordinator)
            
            navigationController.setViewControllers([feedViewController], animated: true)
            navigationController.navigationBar.barTintColor = UIColor.systemGray5
            navigationController.navigationBar.standardAppearance = Factory.navigationBarAppearance
            navigationController.tabBarItem.setTitleTextAttributes(Factory.attributes,for: .normal)
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
            navigationController.tabBarItem = UITabBarItem(
                title: "Новости",
                image: UIImage(systemName: "list.bullet.circle"),
                selectedImage: UIImage(systemName: "list.bullet.circle.fill")
            )
            
        case .profile:
            let coordinator = ProfileCoordinator()
            let profileViewController = coordinator.showDetail(coordinator: coordinator)
            navigationController.setViewControllers([profileViewController], animated: true)
            navigationController.navigationBar.barTintColor = UIColor.systemGray5
            navigationController.navigationBar.standardAppearance = Factory.navigationBarAppearance
            navigationController.tabBarItem.setTitleTextAttributes(Factory.attributes, for: .normal)
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
            navigationController.tabBarItem = UITabBarItem(
                title: "Профиль",
                image: UIImage(systemName: "person.circle"),
                selectedImage: UIImage(systemName:"person.circle.fill")
            )
        }
    }
    static let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
    
    static let navigationBarAppearance: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray5
        return appearance
    }()
}

