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
	func startLoader()
	func stopLoader()
}

final class PokemonsListView: UIView
{
	private let moduleType: ModuleType
	private let presenter: IPokemonsListPresenter
	private let searchBar = UISearchBar()
	private let tableView = UITableView()
	private let refreshControl = UIRefreshControl()
	private let loader = UIActivityIndicatorView()

	init(presenter: IPokemonsListPresenter, moduleType: ModuleType) {
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

// MARK: - IPokemonsListView
extension PokemonsListView: IPokemonsListView
{
	func startLoader() {
		self.loader.startAnimating()
	}

	func stopLoader() {
		self.loader.stopAnimating()
	}
}

// MARK: - SearchBar delegate
extension PokemonsListView: UISearchBarDelegate
{
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		self.endEditing(true)
	}
}
// MARK: - tableView delegate
extension PokemonsListView: UITableViewDelegate
{
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Constants.Metrics.cellHeight
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - tableView data source
extension PokemonsListView: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
		cell.textLabel?.text = "Experimental cell"
		return cell
	}
}

// MARK: - Private methods
private extension PokemonsListView
{
	func setupUI() {
		let safeArea = self.safeAreaLayoutGuide

		self.backgroundColor = .white
		self.setupRefreshControl()
		self.setupSearchBar(with: safeArea)
		self.setupTableView(with: safeArea)
		self.setupActivityIndicator(with: safeArea)
		self.setAccesabilityIds()
	}

	func setupRefreshControl() {
		self.refreshControl.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
	}

	func setupSearchBar(with safeArea: UILayoutGuide) {
		self.addSubview(self.searchBar)
		self.searchBar.delegate = self
		self.searchBar.enablesReturnKeyAutomatically = false
		self.searchBar.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			searchBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			searchBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
		])
	}

	func setupTableView(with safeArea: UILayoutGuide) {
		self.addSubview(self.tableView)
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.refreshControl = self.refreshControl
		self.tableView.register(Cell.self, forCellReuseIdentifier: Constants.cellIdentifier)
		self.tableView.tableFooterView = UIView()
		self.tableView.keyboardDismissMode = .onDrag
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
			tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
		])
	}

	func setupActivityIndicator(with safeArea: UILayoutGuide) {
		self.addSubview(self.loader)
		loader.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			loader.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			loader.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
		])
	}

	@objc
	func refresh(sender: UIRefreshControl) {
		print("Refreshing")
		sender.endRefreshing()
	}

	func setAccesabilityIds() {
		self.tableView.accessibilityIdentifier = self.moduleType.rawValue + Constants.AccessablityIdPostfix.tableView.rawValue
		self.searchBar.accessibilityIdentifier = self.moduleType.rawValue + Constants.AccessablityIdPostfix.searchBar.rawValue
	}
}
