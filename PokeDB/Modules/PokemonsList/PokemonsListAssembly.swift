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
	public struct Dependencies
	{
	}

	public static func makeModule(dependencies: Dependencies) -> UIViewController {
		let viewController = PokemonsListViewController()
		let router = PokemonsListRouter()
		let presenter = PokemonsListPresenter(router: router)
		let view = PokemonsListView(presenter: presenter)
		presenter.inject(ui: view)
		viewController.title = "Pokemons"
		viewController.view = view
		return viewController
	}
}
