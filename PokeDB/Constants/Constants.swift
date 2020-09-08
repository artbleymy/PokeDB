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
	static let imageCellIdentifier = "ImageCell"

	enum Metrics
	{
		static let cellHeight: CGFloat = 60
		static let padding: CGFloat = 5
		static let detailsImageHeight: CGFloat = 300
		static let detailsImagesCollectionHeight: CGFloat = 100
		static let detailsImageCornerRadius: CGFloat = 5
		static let detailsImagesCollectionWidth: CGFloat = 100
	}

	enum AccessablityIdPostfix: String
	{
		case tableView
		case searchBar
	}

	enum Network
	{
		static let pokeApiUrl = "https://pokeapi.co/api/v2/"
	}
}
