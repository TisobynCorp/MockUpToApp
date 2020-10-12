//
//  extensionUIView.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import Foundation
import UIKit

extension UIView {
	func addSubviews(_ views: UIView...) {
		for view in views {
			addSubview(view)
		}
	}
}
