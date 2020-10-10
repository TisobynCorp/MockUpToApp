//
//  extensionString.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import UIKit
import Foundation

//extension for localization
extension String {
	var localized: String {
		if UserDefaults.standard.string(forKey: "lang") != nil {} else {
			// we set a default, just in case
			UserDefaults.standard.set("fr", forKey: "lang")
			UserDefaults.standard.synchronize()
		}
		
		let lang = UserDefaults.standard.string(forKey: "lang")
		
		let path = Bundle.main.path(forResource: lang, ofType: "lproj")
		let bundle = Bundle(path: path!)
		
		return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
	}
}
