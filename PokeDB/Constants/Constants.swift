//
//  Constants.swift
//  PokeDB
//
//  Created by Станислав Козлов on 20.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

enum Constants
{
	static let tabIcons: [ModuleType: String] = [
		.pokemonsList: "list.dash",
		.favoritesList: "star.fill",
	]

	static let cellIdentifier = "Cell"

	enum Metrics
	{
		static let cellHeight: CGFloat = 60
	}
}
