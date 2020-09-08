//
//  PokemonsListAssembly.swift
//  PokeDB
//
//  Created by Станислав Козлов on 20.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

public enum PokemonsListAssembly
{
	static let moduleType: ModuleType = .pokemonsList

	public struct Parameters
	{
		let showDetailsHandler: (Pokemon, UIViewController) -> Void
	}

	public struct Dependencies
	{
		let pokemonsListRepository: IPokemonsListRepository
		let pokemonsHolder: IPokemonsHolder
		let imageRepository: IImageRepository
	}

	public static func makeModule(dependencies: Dependencies, parameters: Parameters) -> UIViewController {
		let viewController = PokemonsListViewController()
		let router = PokemonsListRouter(viewController: viewController,
										showDetailsHandler: parameters.showDetailsHandler)

		let presenter = PokemonsListPresenter(router: router,
											  pokemonsListRepository: dependencies.pokemonsListRepository,
											  pokemonsHolder: dependencies.pokemonsHolder,
											  imageRepository: dependencies.imageRepository)
		let view = PokemonsListView(presenter: presenter, moduleType: self.moduleType)
		presenter.inject(ui: view)
		viewController.inject(presenter: presenter)
		viewController.title = self.moduleType.moduleTitle()
		viewController.view = view
		return viewController
	}
}
