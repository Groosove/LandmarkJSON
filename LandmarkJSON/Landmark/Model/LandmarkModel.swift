//
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit
import CoreLocation

typealias UniqueIdentifier = String

protocol UniqueIdentifiable {
    var uid: UniqueIdentifier { get }
}

struct LandmarkModel: Decodable {
//	let uid: UniqueIdentifier
	let name: String
	let category: String
	let city: String
	let id: Int
	let park: String
	var coordinates: Coordinates
	var imageName: String
	var isFavorite: Bool
	
	private var image: UIImage { UIImage(imageLiteralResourceName: imageName) }
	private var coordinate: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude) }
	
	struct Coordinates: Decodable {
		var latitude: Double
		var longitude: Double
	}
}

//extension LandmarkModel: Equatable {
//    static func == (lhs: LandmarkModel, rhs: LandmarkModel) -> Bool {
//        return lhs.uid == rhs.uid
//    }
//}
