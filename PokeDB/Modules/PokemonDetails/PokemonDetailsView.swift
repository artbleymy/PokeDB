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
	func reloadCollectionViewData()
	func setMainImage(_ image: UIImage)
	func setSelectedImage(at index: Int)
}

final class PokemonDetailsView: UIView
{
	private let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.alignment = .fill
		stackView.spacing = Constants.Metrics.padding
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	private let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.setCollectionViewLayout(layout, animated: true)
		collectionView.backgroundColor = .clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		return collectionView
	}()

	private let bottomView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private let loader: UIActivityIndicatorView = {
		let loader = UIActivityIndicatorView()
		loader.translatesAutoresizingMaskIntoConstraints = false
		return loader
	}()

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
		self.loader.startAnimating()
	}

	func stopLoader() {
		self.loader.stopAnimating()
	}

	func reloadCollectionViewData() {
		self.collectionView.reloadData()
	}

	func setMainImage(_ image: UIImage) {
		self.imageView.image = image
	}

	func setSelectedImage(at index: Int) {
		let indexPath = IndexPath(row: index, section: 0)
		self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
	}
}

extension PokemonDetailsView: UICollectionViewDataSource
{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.presenter.imagesCount
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Constants.imageCellIdentifier, for: indexPath)
		if let cell = cell as? ImageCell {
			cell.imageView.image = self.presenter.getImage(by: indexPath.row)
		}
		return cell
	}
}

extension PokemonDetailsView: UICollectionViewDelegate
{
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.presenter.setSelectedImage(index: indexPath.row)
	}
}

extension PokemonDetailsView: UICollectionViewDelegateFlowLayout
{
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: Constants.Metrics.detailsImagesCollectionWidth,
					  height: Constants.Metrics.detailsImagesCollectionHeight)
	}
}

private extension PokemonDetailsView
{
	func setupUI() {
		let safeArea = self.safeAreaLayoutGuide
		self.backgroundColor = .white
		self.imageView.image = nil
		self.addSubview(self.stackView)
		self.stackView.addArrangedSubview(self.imageView)
		self.stackView.addArrangedSubview(self.collectionView)
		self.stackView.addArrangedSubview(self.bottomView)
		self.setupConstraints(safeArea: safeArea)
		self.setupActivityIndicator(with: safeArea)

		self.collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
	}

	func setupConstraints(safeArea: UILayoutGuide) {
		let stackViewConstraints = [
			self.stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Constants.Metrics.padding),
			self.stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Constants.Metrics.padding),
			self.stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Constants.Metrics.padding),
			self.stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -Constants.Metrics.padding),
		]

		let imageViewConstraints = [
			self.imageView.heightAnchor.constraint(equalToConstant: Constants.Metrics.detailsImageHeight),
		]

		let collectionConstraints = [
			self.collectionView.heightAnchor.constraint(equalToConstant: Constants.Metrics.detailsImagesCollectionHeight),
		]
		NSLayoutConstraint.activate(stackViewConstraints + imageViewConstraints + collectionConstraints)
	}

	func setupActivityIndicator(with safeArea: UILayoutGuide) {
		self.addSubview(self.loader)
		NSLayoutConstraint.activate([
			loader.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			loader.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
		])
	}
}
