//
//  PokemonsListPresenter.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

protocol IPokemonsListPresenter: AnyObject
{
	func inject(ui: IPokemonsListView)
}
final class PokemonsListPresenter
{
	private weak var ui: IPokemonsListView?
	private let router: IPokemonsListRouter
	private let pokemonsListRepository: IPokemonsListRepository

	init(router: IPokemonsListRouter,
		 pokemonsListRepository: IPokemonsListRepository) {
		self.router = router
		self.pokemonsListRepository = pokemonsListRepository
		self.loadPokemons()
	}
}
extension PokemonsListPresenter: IPokemonsListPresenter
{
	func inject(ui: IPokemonsListView) {
		self.ui = ui
	}
}

private extension PokemonsListPresenter
{
	func loadPokemons() {
		self.pokemonsListRepository.loadPokemons { result in
			switch result {
			case .success(let pokemonsList):
				print(pokemonsList.results)
			case .failure(let error):
				print(error)
			}
		}
	}
}
