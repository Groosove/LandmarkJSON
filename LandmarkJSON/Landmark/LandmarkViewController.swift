//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

protocol LandmarkDisplayLogic: AnyObject {
    func displaySomething(viewModel: Landmark.Something.ViewModel)
}

protocol LandmarkViewControllerDelegate: AnyObject {
	func landmarkDescription(id: Int)
}

class LandmarkViewController: UIViewController, LandmarkViewDelegate {
    let interactor: LandmarkBusinessLogic
    var state: Landmark.ViewControllerState
	private var switchValue = true
	var tableDataSource = LandmarkDataStore()
	var tableDelegate = LandmarkTableViewDelegate()
	lazy var customView = self.view as? LandmarkView
	
    init(interactor: LandmarkBusinessLogic, initialState: Landmark.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
		tableDelegate.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
		self.view = LandmarkView(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.title = "Landmarks"
        doSomething()
    }

    @objc func doSomething() {
		switchValue = !switchValue
		let request = Landmark.Something.Request(isActive: switchValue)
        interactor.doSomething(request: request)
    }
}

extension LandmarkViewController: LandmarkDisplayLogic {
    func displaySomething(viewModel: Landmark.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    private func display(newState: Landmark.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
			tableDelegate.models = items
			tableDataSource.models = items
			customView?.updateTableViewData(delegate: tableDelegate, dataSource: tableDataSource)
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}

extension LandmarkViewController: LandmarkViewControllerDelegate {
	func landmarkDescription(id: Int) {
		let rootVC = LandmarkDescriptionViewController()
		let navVC = UINavigationController()
		navVC.pushViewController(rootVC, animated: true)
	}
}
