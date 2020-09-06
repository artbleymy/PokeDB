//
//  ImageRepository.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

protocol IImageRepository
{
	func loadImageFromUrl(_ url: URL?, completion: @escaping (UIImage) -> Void)

	func loadSprites(sprites: PokemonSprites, completion: @escaping (Result<[UIImage], Error>) -> Void)
}

final class ImageRepository: IImageRepository
{
	func loadImageFromUrl(_ url: URL?, completion: @escaping (UIImage) -> Void) {
		if let url = url {
			if let imageFromCache = Cache.imageCache.object(forKey: url as AnyObject) as? UIImage {
				completion(imageFromCache)
			}
			else {
				DispatchQueue.global(qos: .userInitiated).async {
					let contentsOfURL = try? Data(contentsOf: url)
					DispatchQueue.main.async {
						if let imageData = contentsOfURL, let image = UIImage(data: imageData)  {
							completion(image)
							Cache.imageCache.setObject(image, forKey: url as AnyObject)
						}
					}
				}
			}
		}
	}

	func loadSprites(sprites: PokemonSprites, completion: @escaping (Result<[UIImage], Error>) -> Void) {
		let dispatchGroup = DispatchGroup()

		var images: [UIImage] = []

		[
			sprites.frontDefault,
			sprites.frontFemale,
			sprites.frontShiny,
			sprites.frontShinyFemale,
			sprites.backDefault,
			sprites.backFemale,
			sprites.backShiny,
			sprites.backShinyFemale,
			]
			.compactMap{ $0 }
			.forEach { url in
				let completion: (UIImage) -> Void = { image in
					images.append(image)
					dispatchGroup.leave()
				}
				dispatchGroup.enter()
				self.loadImageFromUrl(url, completion: completion)
			}

		dispatchGroup.notify(queue: .main) {
			DispatchQueue.main.async {
				completion(.success(images))
			}
		}
	}
}
