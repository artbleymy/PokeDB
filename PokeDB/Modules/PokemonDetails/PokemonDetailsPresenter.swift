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
	var imagesCount: Int { get }

	func inject(ui: IPokemonDetailsView)
	func getImage(by index: Int) -> UIImage
	func setSelectedImage(index: Int)
}

final class PokemonDetailsPresenter
{
	private weak var ui: IPokemonDetailsView?
	private let router: IPokemonDetailsRouter
	private let imageRepository: IImageRepository
	private let pokemon: Pokemon
	private var images: [UIImage] = []
	private var selectedImageIndex = 0

	init(router: IPokemonDetailsRouter,
		 imageRepository: IImageRepository,
		 pokemon: Pokemon) {
		self.router = router
		self.imageRepository = imageRepository
		self.pokemon = pokemon
		self.loadImages()
	}
}

extension PokemonDetailsPresenter: IPokemonDetailsPresenter
{
	var imagesCount: Int {
		self.images.count
	}

	func inject(ui: IPokemonDetailsView) {
		self.ui = ui
	}

	func getImage(by index: Int) -> UIImage {
		self.images[index]
	}

	func setSelectedImage(index: Int) {
		self.ui?.setMainImage(self.images[index])
		self.selectedImageIndex = index
	}
}

private extension PokemonDetailsPresenter
{
	func loadImages() {
		self.ui?.startLoader()
		self.imageRepository.loadSprites(sprites: self.pokemon.sprites) { [weak self] result in
			self?.ui?.stopLoader()
			guard let self = self else { return }
			switch result {
			case .success(let images):
				self.images = images
				self.ui?.reloadCollectionViewData()
				if self.images.count > 0 {
					self.setSelectedImage(index: 0)
					self.ui?.setSelectedImage(at: self.selectedImageIndex)
				}
			default:
				return
			}
		}
	}
}
