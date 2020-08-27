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
						[{\"id\": 1, \"name\": \"pikachu\", \"sprites\": []}]
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
