//
//  Created by Artur Lutfullin on 25/06/2021.
//

protocol LandmarkProviderProtocol {
    func getItems(completion: @escaping ([LandmarkModel]?, LandmarkProviderError?) -> Void)
}

enum LandmarkProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

struct LandmarkProvider: LandmarkProviderProtocol {
    let dataStore: LandmarkDataStore
    let service: LoadDataFromJSONProtocol

    init(dataStore: LandmarkDataStore = LandmarkDataStore(), service: LoadDataFromJSONProtocol = LoadDataFromJSON()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([LandmarkModel]?, LandmarkProviderError?) -> Void) {
        if dataStore.models?.isEmpty == false {
            return completion(self.dataStore.models, nil)
        }
        service.loadData(with: "landmarkData.json") { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                self.dataStore.models = models
                completion(self.dataStore.models, nil)
				print("Wow")
            }
        }
    }
}
