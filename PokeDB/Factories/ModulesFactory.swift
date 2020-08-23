//
//  ModuleFactory.swift
//  PokeDB
//
//  Created by Станислав Козлов on 20.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

struct ModulesFactory
{
	func makeTabsModule() -> UIViewController {
		let tabBarController = UITabBarController()

		let pokemonsTab = self.makePokemonsTab()
		let favoritesTab = self.makeFavoritesTab()

		tabBarController.viewControllers = [pokemonsTab, favoritesTab]
		tabBarController.viewControllers?.forEach {
			self.configureTabItem(for: $0)
		}
		tabBarController.navigationController?.navigationBar.isHidden = true
		return tabBarController
	}
}

private extension ModulesFactory
{
	func makePokemonsTab() -> UIViewController {
		return self.makeNavigationController(with: self.makePokemonsList())
	}

	func makeFavoritesTab() -> UIViewController {
		return self.makeNavigationController(with: self.makeFavorites())
	}

	func makePokemonsList() -> UIViewController {
		let dependencies = PokemonsListAssembly.Dependencies()
		let pokemonsListModule = PokemonsListAssembly.makeModule(dependencies: dependencies)
		return pokemonsListModule
	}

	func makeFavorites() -> UIViewController {
		let dependencies = FavoritesAssembly.Dependencies()
		let favoritesModule = FavoritesAssembly.makeModule(dependencies: dependencies)
		return favoritesModule
	}

	func makeNavigationController(with rootViewController: UIViewController) -> UIViewController {
		let navigationController = UINavigationController(rootViewController: rootViewController)
		navigationController.navigationBar.prefersLargeTitles = true
		return navigationController
	}

	func configureTabItem(for controller: UIViewController) {
		guard let title = controller.title else {
			assertionFailure("Empty controller title")
			return
		}

		guard let iconName = Constants.tabIcons[title] else {
			assertionFailure("No iconName for title \(title)")
			return
		}

		guard let icon = UIImage(systemName: iconName) else {
			assertionFailure("Wrong system icon name \(iconName)")
			return
		}

		let item = UITabBarItem(title: title,
								image: icon,
								selectedImage: icon)
		controller.tabBarItem = item
	}
}
