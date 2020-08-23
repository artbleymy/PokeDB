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
final class PokemonsListPresenter: IPokemonsListPresenter
{
	private weak var ui: IPokemonsListView?
	private let router: IPokemonsListRouter

	init(router: IPokemonsListRouter) {
		self.router = router
	}

	func inject(ui: IPokemonsListView) {
		self.ui = ui
	}
}
