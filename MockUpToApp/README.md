# 	Mock up to start project by Tisobyn

## Make your your app without storyboard
	1. Delete 	Main.storyboard
	2. Open info.plist. Search 'Main'and delete every line with main. There are only two line
	3. Add below code in correct place n SceneDelegate.swift 
	```
			var window: UIWindow?
			var appCoordinator: AppCoordinator?
			
			
			func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions:   UIScene.ConnectionOptions) {
			guard let scene = (scene as? UIWindowScene) else { return }

			let window = UIWindow(windowScene: scene)
			appCoordinator = AppCoordinator(window: window)
			appCoordinator?.start()
	}
	
	```
	4. Add new file AppCoordinator as in this project
	
		
## Install SwiftLint
	1. If SwiftLint is not installed install using homebrew. You can google it in native documentation
	2. App -> build phases -> press + button -> add new run script bases -> Rename it as "SwiftLint"
	3. Add this code in script
	
	```
		if which swiftlint >/dev/null; then
		swiftlint
		else
		echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
		fi
		
	```
	
	4. Create .swiftlint.yml and put rules below in that file. YOu can see in this project file as invisible file
	
	```
		disabled_rules:
		- trailing_whitespace
		
		opt_in_rules:
		- empty_count
		- empty_string
		
		excluded:
		- Carthage
		- Pods
		- SwiftLint/Common/3rdPartyLib
		
		line_length:
		warning: 150
		error: 200
		ignores_function_declarations: true
		ignores_comments: true
		ignores_urls: true
		
		
		function_body_length:
		warning: 300
		error: 500
		
		
		function_parameter_count:
		warning: 6
		error: 8
		
		
		type_body_length:
		warning: 300
		error: 500
		
		
		file_length:
		warning: 1000
		error: 1500
		ignore_comment_only_lines: true
		
		
		cyclomatic_complexity:
		warning: 15
		error: 25
		
		reporter: "xcode"
		
	```
	5. Check Every Warning
## Change workflow of projects
	1. Create work flow as in this project
	-> Main
	-> AppCoordinators
	-> Network
		->GetRequests
		->PostRequests
		->PutRequests
	-> Helpers
		-> AppFonts
			-> Fonts
		-> AppColors
		-> CustomUI
			-> Buttons
			-> Labels
			-> TextFields
			-> Views
			-> ...etc
		-> Extentions
		-> Enums
	-> ViewModel
	-> Model
	-> View

## Install framework in pods or SPM
	*Must be in project*
	1.SnapKit
	*Must be in project if app work with network*
	2.Alamofire
	3.SwiftyJson
	*Must be in project if app work needs to bo reactive*
	5 RxSwift
	6 RxCocoa
## Add colors to Assets 
	1. Add every color in assets
	2. Add class UIColor so we can use colors as variables
## Add fonts 
	1. Add every font into file
	2. Add every font into plist as Font provided by application
	3. Create Class for font to make variables UIFONT as in file Helpers->AppFonts->AppFonts
	
	
	
###  At last you need commit in your git



