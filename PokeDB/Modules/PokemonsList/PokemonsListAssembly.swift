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

	public struct Dependencies
	{
		let pokemonsListRepository: IPokemonsListRepository
	}

	public static func makeModule(dependencies: Dependencies) -> UIViewController {
		let viewController = PokemonsListViewController()
		let router = PokemonsListRouter()
		let presenter = PokemonsListPresenter(router: router, pokemonsListRepository: dependencies.pokemonsListRepository)
		let view = PokemonsListView(presenter: presenter, moduleType: self.moduleType)
		presenter.inject(ui: view)
		viewController.title = self.moduleType.moduleTitle()
		viewController.view = view
		return viewController
	}
}
