//
//  UIImageView+makeRounded.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import UIKit

extension UIImageView
{
	func makeRounded() {
		self.contentMode = .scaleAspectFill
		self.layer.cornerRadius = (Constants.Metrics.cellHeight - 2 * Constants.Metrics.padding) / 2
		self.clipsToBounds = true
	}
}
