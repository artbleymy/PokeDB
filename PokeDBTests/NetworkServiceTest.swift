//
//  NetworkServiceTest.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import XCTest
@testable import PokeDB

final class NetworkServiceTests: XCTestCase
{
	func testNetworkService() {
		let pokemonsList = [
			Pokemon(id: 1, name: "pikachu", order: 2, sprites: []),
			Pokemon(id: 2, name: "raichu", order: 5, sprites: []),
		]

		let networkService = NetworkServiceMock(response: "pokemons_list")

		networkService.request(to: .pokemon) { (result: Result<[Pokemon], ServiceError>) in
			switch result {
			case .success(let pokemons):
				XCTAssertEqual(pokemons, pokemonsList)
			case .failure:
				XCTAssert(false, "Network service failed")
			}
		}
	}

	func testNetworkServideParsingError() {
		let networkService = NetworkServiceMock(response: "pokemons_list_invalid")
		networkService.request(to: .pokemon) { (result: Result<[Pokemon], ServiceError>) in
			switch result {
			case .failure(.parsingError):
				return
			default:
				XCTAssert(false, "Network service parsing error failed")
			}
		}
	}
}
