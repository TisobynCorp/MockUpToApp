//
//  EndPoint.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import Foundation
import Alamofire

protocol EndPointType {
	var baseURL: String { get }
	var path: String { get }
	var httpMethod: HTTPMethod { get }
	var headers: HTTPHeaders? { get }
	var url: URL { get }
	var encoding: ParameterEncoding { get }
	var query: String { get }
	var params: [String: Any]? { get }
}
extension EndPointType {
	
	var baseURL: String {
		return "https://baseURL.com/"
	}
	var headers: HTTPHeaders? {
		return ["Content-Type": "application/json"]
	}
	
	var encoding: ParameterEncoding {
		return JSONEncoding.default
	}
	
	var url: URL {
		print(URL(string: self.baseURL + self.path + self.query)!)
		return URL(string: self.baseURL + self.path + self.query)!
	}
	
}
