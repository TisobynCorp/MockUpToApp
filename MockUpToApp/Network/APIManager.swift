//
//  APIManager.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias ResultHandler<T> = (ResultResponse<T>) -> Void

enum ResultResponse<Value> {
	case success(Value)
	case failure(ResponseError?)
}

struct ResponseError {
	let errorCode: Int
	let errorMessage: String
}

class APIManager {
	// MARK: - Vars & Lets
	private static var sharedApiManager: APIManager = {
		let apiManager = APIManager()
		
		return apiManager
	}()
	
	// MARK: - Accessors
	class func shared() -> APIManager {
		return sharedApiManager
	}
	
	private let queue = Dispatch.DispatchQueue(label: "ApiManager", qos: .background, attributes: .concurrent)
	
	func request<T>(type: EndPointType, handler: @escaping ResultHandler<T>) where T: Codable {
		AF.request(type.url, method:
				   type.httpMethod,
				   parameters: type.params,
				   encoding: type.encoding,
				   headers: type.headers)
				   .validate()
				  .responseJSON { response in
				print("\nStart Debug")
				print(response.debugDescription)
				print("End\n")

				switch response.result {
				case .success:
					print("Success request")
					let decoder = JSONDecoder()
					if let data = response.data {
						if let jsonResult = try? decoder.decode(T.self, from: data) {
							handler(.success(jsonResult))
						} else {
							let error = ResponseError(errorCode: 999, errorMessage: FailureError.jsonEncodingFailed.rawValue)
							print("JSON Decode failed\n")
							handler(.failure(error))
						}
					} else {
						let error = ResponseError(errorCode: 999, errorMessage: FailureError.emptyData.rawValue)
						print("Empty response Data\n")
						handler(.failure(error))
					}
					
					if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url {
						let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
						for cookie in cookies {
							let name = cookie.name
							if name == "csrftoken" {
								UserDefaults.standard.set(cookie.value, forKey: "csrftoken")
							}
						}
					}
				case .failure(let err):
					print("Request is Failed")
					if err.responseCode == 417 {
						let error = ResponseError(errorCode: 417, errorMessage: "Token need refresh")
						handler(.failure(error))
					}
					let decoder = JSONDecoder()
					if let data = response.data {
						if let jsonResult = try? decoder.decode(T.self, from: data) {
							print("Failed request succesfully returned body")
							handler(.success(jsonResult))
						} else {
							let error = ResponseError(errorCode: 999, errorMessage: FailureError.jsonEncodingFailed.rawValue)
							print("JSON Decode failed\n")
							handler(.failure(error))
						}
					} else {
						let error = ResponseError(errorCode: 999, errorMessage: FailureError.emptyData.rawValue)
						print("Empty response Data\n")
						handler(.failure(error))
					}
					
				}
		}
	}
	
}
