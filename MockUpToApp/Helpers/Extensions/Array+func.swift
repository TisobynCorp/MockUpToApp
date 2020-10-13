//
//  Array+func.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 13.10.2020.
//

import Foundation
import UIKit

extension Array where Element: Numeric {
	func sum()->Element{
		return self.reduce(0) { ($0, $1) as! Element }
	}
}

extension Array where Element: Equatable {
	func compare()->Bool{
		
		return true
	}
}

extension Array where Element == String {
	func concatenate() -> String{
		return self.reduce("", {$0 + $1 + " " })
	}
}
