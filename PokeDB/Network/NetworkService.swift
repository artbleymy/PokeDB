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
							   completion: @escaping (Result<T, ServiceError>, URL) -> Void)

	func request<T: Decodable>(from url: URL?,
							   completion: @escaping (Result<T, ServiceError>, URL) -> Void)
}

final class NetworkService: INetworkService
{
	private let session = URLSession(configuration: .default)
	private var dataTask: URLSessionDataTask?

	func request<T: Decodable>(to endpoint: Endpoint,
							   completion: @escaping (Result<T, ServiceError>, URL) -> Void) {

		let urlComponent = URLComponents(string: Constants.Network.pokeApiUrl + endpoint.rawValue)

		guard let url = urlComponent?.url else {
			assertionFailure("Invalid url")
			return
		}

		self.fetch(url, completion: completion)
	}

	func request<T: Decodable>(from url: URL?,
							   completion: @escaping (Result<T, ServiceError>, URL) -> Void) {

		guard let url = url else {
			assertionFailure("Invalid url")
			return
		}
		self.fetch(url, completion: completion)
	}
}

private extension NetworkService
{
	func fetch<T: Decodable>(_ url: URL, completion: @escaping (Result<T, ServiceError>, URL) -> Void) {

		dataTask = session.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(.networkError(error)), url)
			}
			else {
				guard let httpResponse = response as? HTTPURLResponse else {
					completion(.failure(.httpResponseError), url)
					return
				}

				guard 200..<300 ~= httpResponse.statusCode else {
					completion( .failure(.httpError(httpResponse.statusCode)), url)
					return
				}

				if let data = data {
					do {
						let resultData = try JSONDecoder().decode(T.self, from: data)
						completion(.success(resultData), url)
					}
					catch {
						completion(.failure(.parsingError(error)), url)
					}
				}
				else {
						completion( .failure(.dataError), url)
				}
			}
		}

		dataTask?.resume()
	}
}
