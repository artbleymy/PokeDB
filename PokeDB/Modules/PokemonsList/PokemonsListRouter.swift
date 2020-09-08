//
//  PokemonsListRouter.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

protocol IPokemonsListRouter: AnyObject
{
	func showDetails(pokemon: Pokemon)
}

final class PokemonsListRouter: IPokemonsListRouter
{
	private let viewController: UIViewController
	private let showDetailsHandler: (Pokemon, UIViewController) -> Void

	init(viewController: UIViewController,
		 showDetailsHandler: @escaping (Pokemon, UIViewController) -> Void) {
		self.viewController = viewController
		self.showDetailsHandler = showDetailsHandler
	}

	func showDetails(pokemon: Pokemon) {
		self.showDetailsHandler(pokemon, self.viewController)
	}
}
