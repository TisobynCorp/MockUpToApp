//
//  ViewController.swift
//  MockUpToApp
//
//  Created by Yermek Sabyrzhan on 10.10.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	
	private lazy var customView: UIView = {

		let view = UIView(frame: UIScreen.main.bounds)
		view.backgroundColor = #colorLiteral(red: 0.1317085624, green: 1, blue: 1, alpha: 1)
		return view
		
	}()
	fileprivate var titleLabel: UILabel = {
		
		let label = UILabel(frame: .zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.text = "Title"
		label.textColor = AppColor.title
		return label
		
	}()
	
	// MARK: Life Cycle
	override func loadView() {
		setupCustomView()
		view = customView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	private func setupCustomView() {
		customView.addSubview(titleLabel)
//		customView.snp.mak
	}
}
