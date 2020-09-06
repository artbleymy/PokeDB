//
//  ImageCell.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

final class ImageCell: UICollectionViewCell
{
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = Constants.Metrics.detailsImageCornerRadius
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override var isSelected: Bool {
		didSet {
			self.imageView.layer.borderColor = isSelected ? UIColor.blue.cgColor : UIColor.clear.cgColor
			self.imageView.layer.borderWidth = isSelected ? 2 : 0
		}
	}
}

private extension ImageCell
{
	func setupUI() {
		self.addSubview(imageView)
		self.setupConstraints()
	}

	func setupConstraints() {
		let imageViewConstraints = [
			self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
			self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
		]

		NSLayoutConstraint.activate(imageViewConstraints)
	}
}
