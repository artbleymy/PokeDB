//
//  PokemonDetailsView.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

protocol IPokemonDetailsView: AnyObject
{
	func startLoader()
	func stopLoader()
}

final class PokemonDetailsView: UIView
{
	private let moduleType: ModuleType
	private let presenter: IPokemonDetailsPresenter

	init(presenter: IPokemonDetailsPresenter, moduleType: ModuleType) {
		self.presenter = presenter
		self.moduleType = moduleType
		super.init(frame: .zero)
		self.setupUI()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PokemonDetailsView: IPokemonDetailsView
{
	func startLoader() {
	}

	func stopLoader() {
	}
}

private extension PokemonDetailsView
{
	func setupUI() {
	}
}
