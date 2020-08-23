//
//  PokemonsListView.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

protocol IPokemonsListView: AnyObject
{
}

final class PokemonsListView: UIView
{
	private let presenter: IPokemonsListPresenter

	init(presenter: IPokemonsListPresenter) {
		self.presenter = presenter
		super.init(frame: .zero)
		self.setupUI()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PokemonsListView: IPokemonsListView
{
}

private extension PokemonsListView
{
	func setupUI() {
		self.backgroundColor = .green
	}
}
