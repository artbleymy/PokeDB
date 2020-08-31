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
	func loadPokemons(completion: @escaping (Result<PokemonsList, ServiceError>) -> Void) {
		let pokemonsList = PokemonsList(count: 1050,
										next: URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"),
										previous: nil,
										results: [
											NamedAPIResource(name: "bulbasaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")),
											NamedAPIResource(name: "ivysaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/2/")),
										])

		completion(.success(pokemonsList))
	}
}
