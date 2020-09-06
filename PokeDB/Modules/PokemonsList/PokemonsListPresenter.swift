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
	var currentCount: Int { get }

	func inject(ui: IPokemonsListView)
	func setUpCell(_ cell: Cell, index: Int)
}
final class PokemonsListPresenter
{
	private weak var ui: IPokemonsListView?
	private let router: IPokemonsListRouter
	private let pokemonsListRepository: IPokemonsListRepository
	private let pokemonsHolder: IPokemonsHolder
	private let imageRepository: IImageRepository

	init(router: IPokemonsListRouter,
		 pokemonsListRepository: IPokemonsListRepository,
		 pokemonsHolder: IPokemonsHolder,
		 imageRepository: IImageRepository) {
		self.router = router
		self.pokemonsListRepository = pokemonsListRepository
		self.pokemonsHolder = pokemonsHolder
		self.imageRepository = imageRepository
		self.loadPokemons()
	}
}
extension PokemonsListPresenter: IPokemonsListPresenter
{
	var currentCount: Int {
		self.pokemonsHolder.pokemons.count
	}

	func setUpCell(_ cell: Cell, index: Int) {
		cell.tag = index
		cell.cellTitle.text = self.pokemonsHolder.pokemons[index].name
		let url = self.pokemonsHolder.pokemons[index].sprites.frontDefault
		self.imageRepository.loadImageFromUrl(url) { image in
			if cell.tag == index {
				cell.icon.image = image
			}
		}
	}

	func inject(ui: IPokemonsListView) {
		self.ui = ui
	}
}

private extension PokemonsListPresenter
{
	func loadPokemons() {
		self.ui?.startLoader()
		self.pokemonsListRepository.loadPokemons { result in
			self.ui?.stopLoader()
			switch result {
			case .success(let pokemons):
				self.pokemonsHolder.set(pokemons)
				self.ui?.reloadTableData()
			case .failure(let error):
				print(error)
			}
		}
	}
}
