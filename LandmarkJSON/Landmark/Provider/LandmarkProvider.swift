//
//  Created by Artur Lutfullin on 25/06/2021.
//

protocol LandmarkProviderProtocol {
    func getItems(completion: @escaping ([LandmarkModel]?, LandmarkProviderError?) -> Void)
}

enum LandmarkProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля Landmark
struct LandmarkProvider: LandmarkProviderProtocol {
    let dataStore: LandmarkDataStore
    let service: LandmarkServiceProtocol

    init(dataStore: LandmarkDataStore = LandmarkDataStore(), service: LandmarkServiceProtocol = LandmarkService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([LandmarkModel]?, LandmarkProviderError?) -> Void) {
        if dataStore.models?.isEmpty == false {
            return completion(self.dataStore.models, nil)
        }
        service.fetchItems { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                self.dataStore.models = models
                completion(self.dataStore.models, nil)
            }
        }
    }
}
