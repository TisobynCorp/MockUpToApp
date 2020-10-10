//
//  GetSomething.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import Foundation
import Alamofire

// MARK: User Info
struct GetUserInfoRequest: EndPointType {
	
//	var token : String
//	init(token: String) {
//		self.token = token
//	}
	
	var path: String {
		return "users/me/"
	}
	
	var httpMethod: HTTPMethod {
		return .get
	}
	
	var query: String {
		return ""
	}
	
	var params: [String: Any]? {
		return nil
	}
	
	var headers: HTTPHeaders? {
//		let a = "Token " + token
		return [
			"Content-Type": "application/json"
//			"Authorization": a
		]
		
	}
}
