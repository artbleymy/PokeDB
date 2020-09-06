//
//  PokemonsListViewController.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

protocol IPokemonsListViewController
{
	func inject(presenter: IPokemonsListPresenter)
}
final class PokemonsListViewController: UIViewController
{
	private var presenter: IPokemonsListPresenter?
	private let searchController = UISearchController()

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationItem.searchController = searchController
		self.navigationItem.hidesSearchBarWhenScrolling = false
	}
}

extension PokemonsListViewController: IPokemonsListViewController
{
	func inject(presenter: IPokemonsListPresenter) {
		self.presenter = presenter
	}
}
