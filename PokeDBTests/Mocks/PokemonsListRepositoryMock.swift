//
//  PokemonsListRepositoryMock.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
// swiftlint:disable force_unwrapping

import Foundation
@testable import PokeDB

final class PokemonsListRepositoryMock: IPokemonsListRepository
{
	func loadPokemons(completion: @escaping (Result<[Pokemon], ServiceError>) -> Void) {
		let pokemonsList = [
			Pokemon(id: 1,
					name: "bulbasaur",
					url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")!,
					imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!),
			Pokemon(id: 2,
					name: "ivysaur",
					url: URL(string: "https://pokeapi.co/api/v2/pokemon/2/")!,
					imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png")!),
		]

		completion(.success(pokemonsList))
	}
}
