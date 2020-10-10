//
//  PostSomeRequest.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import Foundation
import Alamofire

// MARK: UserRegister
struct PostSomethingRequest: EndPointType {
	
	var email: String!
	var password: String!
	var lang: String!
	
	//  var language : String
	init(email: String, password: String, lang: String) {
		self.email = email
		self.password = password
		self.lang = lang
		
		print("\(String(describing: self.email)) , \(String(describing: self.password))")
	}
	
	var headers: HTTPHeaders? {
		return 	[
			"Accept-Language": lang
		]
	}
	
	var path: String {
		return "users/register/"
	}
	
	var httpMethod: HTTPMethod {
		return .post
	}
	var query: String {
		return ""
	}
	var params: [ String: Any ]? {
		return ["email": self.email!, "password": self.password!]
	}
}
