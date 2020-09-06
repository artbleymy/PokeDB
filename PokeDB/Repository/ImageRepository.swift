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
}
