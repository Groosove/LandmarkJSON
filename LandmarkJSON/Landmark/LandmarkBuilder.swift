//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

class LandmarkBuilder: ModuleBuilder {

    var initialState: Landmark.ViewControllerState?

    func set(initialState: Landmark.ViewControllerState) -> LandmarkBuilder {
        self.initialState = initialState
        return self
    } 

    func build() -> UIViewController {
        let presenter = LandmarkPresenter()
        let interactor = LandmarkInteractor(presenter: presenter)
        let controller = LandmarkViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
