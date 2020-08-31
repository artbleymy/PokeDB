//
//  PokemonsListRepositoryTest.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import XCTest
@testable import PokeDB

final class PokemonsListRepositoryTest: XCTestCase
{
	func testPokemonsListRepository() {
		let pokemonsList = PokemonsList(count: 1050,
										next: URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"),
										previous: nil,
										results: [
											NamedAPIResource(name: "bulbasaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")),
											NamedAPIResource(name: "ivysaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/2/")),
		])

		let pokemonsListRepository = PokemonsListRepositoryMock()

		pokemonsListRepository.loadPokemons { (result: Result<PokemonsList, ServiceError>) in
			switch result {
			case .success(let pokemons):
				XCTAssertEqual(pokemons, pokemonsList)
			case .failure:
				XCTAssert(false, "PokemonsListRepository failed")
			}
		}
	}
}
