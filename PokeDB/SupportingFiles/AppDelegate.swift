//
//  AppDelegate.swift
//  PokeDB
//
//  Created by Станислав Козлов on 18.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate
{
	var window: UIWindow?

	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		let factory = ModulesFactory()
		let tabsModule = factory.makeTabsModule()
		window?.rootViewController = tabsModule
		window?.makeKeyAndVisible()
		return true
	}
}
