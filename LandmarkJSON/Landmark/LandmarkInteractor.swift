//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

protocol LandmarkBusinessLogic {
    func parseJSON(request: Landmark.LoadData.Request)
}

class LandmarkInteractor: LandmarkBusinessLogic {
    let presenter: LandmarkPresentationLogic
    let provider: LandmarkProviderProtocol

    init(presenter: LandmarkPresentationLogic, provider: LandmarkProviderProtocol = LandmarkProvider()) {
        self.presenter = presenter
        self.provider = provider
    }

    func parseJSON(request: Landmark.LoadData.Request) {
        provider.getLandmarks { (items, error) in
            let result: Landmark.LandmarkRequestResult
            if let items = items {
				result = .success(items.filter { $0.isFavorite || !request.isActive })
            } else if let error = error {
				result = .failure(.loadDataError(message: error.localizedDescription))
			} else {
				result = .failure(.emptyDataError(message: "Empty data"))
			}
            self.presenter.presentData(response: Landmark.LoadData.Response(result: result))
        }
    }
}
