//
//  TitleLabel.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import UIKit

class AppName: UILabel {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
	}
	override init(frame: CGRect) {
		super.init(frame: frame)
		configuration()
	}
	func configuration() {
		translatesAutoresizingMaskIntoConstraints = false
		text = "Title"
		font = AppFonts.titleFont
		textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
	}
	
}
