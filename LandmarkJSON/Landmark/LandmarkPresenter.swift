//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

protocol LandmarkPresentationLogic {
    func presentData(response: Landmark.LoadData.Response)
}

class LandmarkPresenter: LandmarkPresentationLogic {
    weak var viewController: LandmarkDisplayLogic?

    func presentData(response: Landmark.LoadData.Response) {
        var viewModel: Landmark.LoadData.ViewModel
        switch response.result {
        case let .failure(error):
            viewModel = Landmark.LoadData.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = Landmark.LoadData.ViewModel(state: .emptyResult)
				break
            }
			viewModel = Landmark.LoadData.ViewModel(state: .result(result))
        }
        viewController?.displayData(viewModel: viewModel)
    }
}
