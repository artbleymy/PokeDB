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
	let networkService = NetworkService()
	let pokemonsListRepository: IPokemonsListRepository
	let pokemonsHolder: IPokemonsHolder
	let imageRepository: IImageRepository

	init() {
		self.pokemonsListRepository = PokemonsListRepository(networkService: networkService)
		self.pokemonsHolder = PokemonsHolder()
		self.imageRepository = ImageRepository()
	}

	func makeTabsModule() -> UIViewController {
		let tabBarController = UITabBarController()

		let pokemonsTab = self.makePokemonsTab()
		let favoritesTab = self.makeFavoritesTab()

		tabBarController.viewControllers = [pokemonsTab, favoritesTab]
		self.configureTabItem(for: pokemonsTab, moduleType: .pokemonsList)
		self.configureTabItem(for: favoritesTab, moduleType: .favoritesList)

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
		let dependencies = PokemonsListAssembly.Dependencies(pokemonsListRepository: self.pokemonsListRepository,
															 pokemonsHolder: self.pokemonsHolder,
															 imageRepository: self.imageRepository)
		let showDetailsHandler: (Pokemon, UIViewController) -> Void = {(pokemon: Pokemon, viewController: UIViewController) in
			let detailsModule = self.makeDetails(pokemon: pokemon)
			viewController.navigationController?.pushViewController(detailsModule, animated: true)
		}
		let parameters = PokemonsListAssembly.Parameters(showDetailsHandler: showDetailsHandler)
		let pokemonsListModule = PokemonsListAssembly.makeModule(dependencies: dependencies, parameters: parameters)

		return pokemonsListModule
	}

	func makeFavorites() -> UIViewController {
		let dependencies = FavoritesAssembly.Dependencies()
		return FavoritesAssembly.makeModule(dependencies: dependencies)
	}

	func makeNavigationController(with rootViewController: UIViewController) -> UIViewController {
		let navigationController = UINavigationController(rootViewController: rootViewController)
		navigationController.navigationBar.prefersLargeTitles = true
		return navigationController
	}

	func makeDetails(pokemon: Pokemon) -> UIViewController {
		let dependencies = PokemonDetailsAssembly.Dependencies(imageRepository: self.imageRepository)
		let parameters = PokemonDetailsAssembly.Parameters(pokemon: pokemon)

		return  PokemonDetailsAssembly.makeModule(dependencies: dependencies, parameters: parameters)
	}

	func configureTabItem(for controller: UIViewController, moduleType: ModuleType) {
		guard let title = controller.title else {
			assertionFailure("Empty controller title")
			return
		}

		guard let iconName = Constants.tabIcons[moduleType] else {
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
