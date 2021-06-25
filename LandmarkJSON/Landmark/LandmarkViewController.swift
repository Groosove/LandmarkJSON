//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

protocol LandmarkDisplayLogic: AnyObject {
    func displaySomething(viewModel: Landmark.Something.ViewModel)
}

class LandmarkViewController: UIViewController {
    let interactor: LandmarkBusinessLogic
    var state: Landmark.ViewControllerState

    init(interactor: LandmarkBusinessLogic, initialState: Landmark.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        let view = LandmarkView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = Landmark.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension LandmarkViewController: LandmarkDisplayLogic {
    func displaySomething(viewModel: Landmark.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: Landmark.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}
