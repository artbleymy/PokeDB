//
//  PokemonsListRepositoryMock.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import Foundation
@testable import PokeDB

final class PokemonsListRepositoryMock: IPokemonsListRepository
{
	func loadPokemons(completion: @escaping (Result<[Pokemon], ServiceError>) -> Void) {
		let pokemonsList = [
			Pokemon(id: 3, name: "pikachu", order: 6, sprites: []),
			Pokemon(id: 4, name: "raichu", order: 8, sprites: []),
		]
		completion(.success(pokemonsList))
	}
}
