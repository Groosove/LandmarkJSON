//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

protocol LandmarkBusinessLogic {
    func doSomething(request: Landmark.Something.Request)
}

/// Класс для описания бизнес-логики модуля Landmark
class LandmarkInteractor: LandmarkBusinessLogic {
    let presenter: LandmarkPresentationLogic
    let provider: LandmarkProviderProtocol

    init(presenter: LandmarkPresentationLogic, provider: LandmarkProviderProtocol = LandmarkProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: Landmark.Something.Request) {
        provider.getItems { (items, error) in
            let result: Landmark.LandmarkRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: Landmark.Something.Response(result: result))
        }
    }
}
