//
//  PokemonDetailsAssembly.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

public enum PokemonDetailsAssembly
{
	static let moduleType: ModuleType = .pokemonDetails

	public struct Dependencies
	{
		let imageRepository: IImageRepository
	}

	public static func makeModule(dependencies: Dependencies) -> UIViewController {
		let viewController = PokemonDetailsViewController()
		let router = PokemonDetailsRouter()
		let presenter = PokemonDetailsPresenter(router: router,
												imageRepository: dependencies.imageRepository)
		let view = PokemonDetailsView(presenter: presenter, moduleType: self.moduleType)
		presenter.inject(ui: view)
		viewController.inject(presenter: presenter)
		viewController.title = self.moduleType.moduleTitle()
		viewController.view = view
		return viewController
	}
}
