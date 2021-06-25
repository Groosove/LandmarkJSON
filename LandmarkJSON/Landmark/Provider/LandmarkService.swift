//
//  Created by Artur Lutfullin on 25/06/2021.
//

protocol LandmarkServiceProtocol {
    func fetchItems(completion: @escaping ([LandmarkModel]?, Error?) -> Void)
}

/// Получает данные для модуля Landmark
class LandmarkService: LandmarkServiceProtocol {

    func fetchItems(completion: @escaping ([LandmarkModel]?, Error?) -> Void) {
        completion(nil, nil)
    }
}
