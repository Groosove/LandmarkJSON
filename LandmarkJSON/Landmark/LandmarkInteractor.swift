//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

protocol LandmarkBusinessLogic {
    func doSomething(request: Landmark.Something.Request)
}

class LandmarkInteractor: LandmarkBusinessLogic {
    let presenter: LandmarkPresentationLogic
    let provider: LandmarkProviderProtocol

    init(presenter: LandmarkPresentationLogic, provider: LandmarkProviderProtocol = LandmarkProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
	
    func doSomething(request: Landmark.Something.Request) {
        provider.getLandmarks { (items, error) in
            let result: Landmark.LandmarkRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
				result = .failure(.decodeError(message: error.localizedDescription))
			} else  {
				result = .failure(.parseError(message: "Empty data"))
			}
            self.presenter.presentSomething(response: Landmark.Something.Response(result: result))
        }
    }
}
