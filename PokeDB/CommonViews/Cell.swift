//
//  Cell.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

final class Cell: UITableViewCell
{
	var icon: UIImageView = {
		let imageView = UIImageView()
//		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	var cellTitle: UILabel = {
		let title = UILabel()
		title.textColor = .black
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupUI()
	}

	@available(*, unavailable) required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}

private extension Cell
{
	func setupUI() {
		self.accessoryType = .disclosureIndicator
		self.addSubview(icon)
		self.addSubview(cellTitle)
		self.setupConstraints()
	}

	func setupConstraints() {
		let iconConstraints = [
			icon.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.Metrics.padding),
			icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.Metrics.padding),
			icon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.Metrics.padding),
			icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
		]

		let titleConstraints = [
			cellTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.Metrics.padding),
			cellTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.Metrics.padding),
			cellTitle.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Constants.Metrics.padding),
			cellTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.Metrics.padding),
		]

		NSLayoutConstraint.activate(iconConstraints + titleConstraints)
	}
}
