//
//  PokemonsListRepository.swift
//  PokeDB
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation

protocol IPokemonsListRepository
{
	func loadPokemons(completion: @escaping (Result<[Pokemon], ServiceError>) -> Void)
}

final class PokemonsListRepository: IPokemonsListRepository
{
	let networkService: INetworkService

	init(networkService: INetworkService) {
		self.networkService = networkService
	}

	func loadPokemons(completion: @escaping (Result<[Pokemon], ServiceError>) -> Void) {
		self.networkService.request(to: .pokemonsList) { (result: Result<PokemonsList, ServiceError>, url: URL)  in
			switch result {
			case .success(let pokemonsList):
				let dispatchGroup = DispatchGroup()
				var pokemons: [Pokemon] = []

				let completionHandler: (Result<ApiPokemon, ServiceError>, URL) -> Void = { result, sourceUrl in
					switch result {
					case .success(let pokemon):
						pokemons.append(Pokemon(from: pokemon, sourceUrl: sourceUrl))
					default:
						assertionFailure("Get pokemon error from \(sourceUrl)")
					}
					dispatchGroup.leave()
				}

				pokemonsList.results.forEach {
					dispatchGroup.enter()
					self.networkService.request(from: $0.url, completion: completionHandler)
				}

				dispatchGroup.notify(queue: .main) {
					completion(.success(pokemons))
				}
			case .failure(let error) :
				completion(.failure(error))
			}
		}
	}
}
