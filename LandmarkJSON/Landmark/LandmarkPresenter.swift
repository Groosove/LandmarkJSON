//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

protocol LandmarkPresentationLogic {
    func presentSomething(response: Landmark.Something.Response)
}

class LandmarkPresenter: LandmarkPresentationLogic {
    weak var viewController: LandmarkDisplayLogic?

    func presentSomething(response: Landmark.Something.Response) {
        var viewModel: Landmark.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = Landmark.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = Landmark.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = Landmark.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
}
