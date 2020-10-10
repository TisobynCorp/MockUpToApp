import Foundation
import Alamofire

struct PutUpdatePassword: EndPointType {
	
	var csrftoken: String
	var oldPassword: String
	var newPassword: String

	var sendDictionary = [String: Any]()
	
	init(token: String, csrftoken: String, newPassword: String, oldPassword: String ) {
		
		self.oldPassword = oldPassword
		self.newPassword = newPassword
		self.csrftoken = csrftoken
		
	}
	
	var path: String {
		return "users/me/"
	}
	
	var httpMethod: HTTPMethod {
		return .put
	}
	
	var query: String {
		return ""
	}
	var params: [ String: Any ]? {
		return [
			"old_password": self.oldPassword,
			"new_password": self.newPassword
		]
	}
	
	var headers: HTTPHeaders? {
				
		return [
			"Content-Type": "application/json",
			"X-CSRFToken": csrftoken,
			"Referer": "https://server.mentalmind.kz"
		]
	}
}
