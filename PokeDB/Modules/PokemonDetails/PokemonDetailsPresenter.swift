//
//  PokemonDetailsPresenter.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit
protocol IPokemonDetailsPresenter
{
	func inject(ui: IPokemonDetailsView)
}

final class PokemonDetailsPresenter
{
	private weak var ui: IPokemonDetailsView?
	private let router: IPokemonDetailsRouter
	private let imageRepository: IImageRepository

	init(router: IPokemonDetailsRouter,
		 imageRepository: IImageRepository) {
		self.router = router
		self.imageRepository = imageRepository
	}
}

extension PokemonDetailsPresenter: IPokemonDetailsPresenter
{
	func inject(ui: IPokemonDetailsView) {
		self.ui = ui
	}
}
