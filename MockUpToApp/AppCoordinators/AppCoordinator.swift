import UIKit

class AppCoordinator {
	
	private let window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		let startingViewController = ViewController()
		
		let navigationController = UINavigationController(rootViewController: startingViewController)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
	
}
