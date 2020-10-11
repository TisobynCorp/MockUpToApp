//
//  protocolCoordinator.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 11.10.2020.
//

import UIKit

protocol Coordinator {
	
	var children: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
