//
//  Landmark module
//  Created by Artur Lutfullin on 25/06/2021.
//

enum Landmark {
    // MARK: Use cases
    enum Something {
        struct Request {
			var isActive: Bool
		}

        struct Response {
            var result: LandmarkRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum LandmarkRequestResult {
        case failure(LandmarkError)
        case success([LandmarkModel])
    }

    enum ViewControllerState {
        case loading
        case result([LandmarkModel])
        case emptyResult
        case error(message: String)
    }

    enum LandmarkError: Error {
		case parseError(message: String)
		case decodeError(message: String)
    }
}
