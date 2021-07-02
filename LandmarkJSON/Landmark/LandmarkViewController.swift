//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

protocol LandmarkDisplayLogic: AnyObject {
    func displayData(viewModel: Landmark.LoadData.ViewModel)
}

protocol LandmarkViewControllerDelegate: AnyObject {
	func landmarkDescription(landmarkId: Int)
}

class LandmarkViewController: UIViewController, LandmarkViewDelegate {
    let interactor: LandmarkBusinessLogic
    var state: Landmark.ViewControllerState
	private var switchValue = true
	var tableDataSource = LandmarkDataStore()
	var tableHandler = LandmarkTableViewDelegate()
	lazy var customView = self.view as? LandmarkView

    init(interactor: LandmarkBusinessLogic, initialState: Landmark.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
		super.init(nibName: nil, bundle: nil)
		tableHandler.delegate = self
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
		parseJSON()
    }

    @objc func parseJSON() {
		switchValue = !switchValue
		let request = Landmark.LoadData.Request(isActive: switchValue)
        interactor.parseJSON(request: request)
    }
}

extension LandmarkViewController: LandmarkDisplayLogic {
    func displayData(viewModel: Landmark.LoadData.ViewModel) {
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
			tableHandler.models = items
			tableDataSource.models = items
			customView?.updateTableViewData(delegate: tableHandler, dataSource: tableDataSource)
        case .emptyResult:
            print("Empty result")
        }
    }
}

extension LandmarkViewController: LandmarkViewControllerDelegate {
	func landmarkDescription(landmarkId: Int) {
		let rootVC = LandmarkDescriptionViewController(dataSource: tableDataSource.models, landmarkId: landmarkId)
		self.navigationController?.pushViewController(rootVC, animated: true)
	}
}
