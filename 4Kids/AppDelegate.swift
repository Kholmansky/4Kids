//
//  AppDelegate.swift
//  4Kids
//
//  Created by Холманский Максим on 22/07/2019.
//  Copyright © 2019 Kholmansky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	lazy var window: UIWindow? = {
		let window = UIWindow()
		window.backgroundColor = .white
		window.makeKeyAndVisible()
		return window
	}()

	lazy var tabRoot = UITabBarController()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		self.window?.rootViewController = self.tabRoot
		let blackVC = ViewController(with: .yellow)
		let redVC = ViewController(with: .blue)
		let greenVC = ViewController(with: .green)

		blackVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
		redVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
		greenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

		self.tabRoot.viewControllers = [blackVC, redVC, greenVC]
		return true
	}
}

