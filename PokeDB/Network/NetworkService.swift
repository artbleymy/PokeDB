//
//  NetworkService.swift
//  PokeDB
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation

protocol INetworkService
{
	func request<T: Decodable>(to endpoint: Endpoint,
							   completion: @escaping (Result<T, ServiceError>) -> Void)
}

final class NetworkService: INetworkService
{
	func request<T: Decodable>(to endpoint: Endpoint,
				 completion: @escaping (Result<T, ServiceError>) -> Void) {
		let data = Data("""
						{\"count\":1050,
						\"next\":\"https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20\",
						\"previous\":null,
						\"results\":[{\"name\":\"bulbasaur\",\"url\":\"https://pokeapi.co/api/v2/pokemon/1/\"}]}
						""".utf8)
		do {
			let resultData = try JSONDecoder().decode(T.self, from: data)
			completion(.success(resultData))
		}
		catch {
			completion(.failure(.parsingError(error)))
		}
	}
}
