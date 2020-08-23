//
//  ModuleType.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

enum ModuleType: String
{
	case pokemonsList
	case pokemonDetails
	case favoritesList
	case favoritesDetails
}

extension ModuleType
{
	func moduleTitle() -> String {
		switch self {
		case .pokemonsList:
			return "Pokemons"
		case .pokemonDetails:
			return  "Pokemon"
		case .favoritesList:
			return "Favorites"
		case .favoritesDetails:
			return "Pokemon"
		}
	}
}
