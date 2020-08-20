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
		let viewController = StartViewController()
		viewController.title = "Pokemons"
		viewController.view.backgroundColor = .blue
		return viewController
	}
}
