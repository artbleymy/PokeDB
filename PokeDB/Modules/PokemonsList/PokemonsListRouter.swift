//
//  PokemonsListRouter.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

protocol IPokemonsListRouter: AnyObject
{
	func showDetails()
}

final class PokemonsListRouter: IPokemonsListRouter
{
	func showDetails() {
		print("Show details")
	}
}
