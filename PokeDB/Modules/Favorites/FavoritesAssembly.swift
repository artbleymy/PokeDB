//
//  FavoritesAssembly.swift
//  PokeDB
//
//  Created by Станислав Козлов on 20.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import UIKit

public enum FavoritesAssembly
{
	public struct Dependencies
	{
	}

	public static func makeModule(dependencies: Dependencies) -> UIViewController {
		let viewController = StartViewController()
		viewController.title = "Favorites"
		return viewController
	}
}
