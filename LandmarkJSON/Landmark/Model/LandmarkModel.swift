//
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit
import CoreLocation

struct LandmarkModel: Decodable {
	let name: String
	let category: String
	let city: String
	let id: Int
	let park: String
	let state: String
	private let coordinates: Coordinates
	private let imageName: String
	let isFavorite: Bool
	let description: String

	var image: UIImage { UIImage(named: imageName)! }
	var coordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
	}

	struct Coordinates: Decodable {
		var latitude: Double
		var longitude: Double
	}
}

extension LandmarkModel: Equatable {
    static func == (lhs: LandmarkModel, rhs: LandmarkModel) -> Bool {
        return lhs.id == rhs.id
    }
}
