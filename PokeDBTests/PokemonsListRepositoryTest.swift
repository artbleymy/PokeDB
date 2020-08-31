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
		let pokemonsList = [
			Pokemon(id: 3, name: "pikachu", order: 6, sprites: []),
			Pokemon(id: 4, name: "raichu", order: 8, sprites: []),
		]

		let pokemonsListRepository = PokemonsListRepositoryMock()

		pokemonsListRepository.loadPokemons { (result: Result<[Pokemon], ServiceError>) in
			switch result {
			case .success(let pokemons):
				XCTAssertEqual(pokemons, pokemonsList)
			case .failure:
				XCTAssert(false, "PokemonsListRepository failed")
			}
		}
	}
}
