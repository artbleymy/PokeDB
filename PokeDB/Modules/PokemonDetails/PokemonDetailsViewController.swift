//
//  PokemonDetailsViewController.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

protocol IPokemonDetailsViewController
{
	func inject(presenter: IPokemonDetailsPresenter)
}

final class PokemonDetailsViewController: UIViewController
{
	private var presenter: IPokemonDetailsPresenter?
}

extension PokemonDetailsViewController: IPokemonDetailsViewController
{
	func inject(presenter: IPokemonDetailsPresenter) {
		self.presenter = presenter
	}
}
