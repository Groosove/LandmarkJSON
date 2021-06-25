//
//  Created by Artur Lutfullin on 25/06/2021.
//

typealias UniqueIdentifier = String

/// Протокол определяющий поведение объектов идентфицируемых уникально
protocol UniqueIdentifiable {
    var uid: UniqueIdentifier { get }
}

/// Модель данных, описывающая ...
struct LandmarkModel: UniqueIdentifiable {
    // Example
    let uid: UniqueIdentifier
    let name: String
}

//import UIKit
//import CoreLocation
//
//struct Landmark: Decodable {
//    var name: String
//    var category: String
//    var city: String
//    var id: Int
//    var park: String
//    private var coordinates: Coordinates
//    private var imageName: String
//
//    var image: UIImage { UIImage(imageLiteralResourceName: imageName) }
//    var coordinate: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude) }
//}
//
//struct Coordinates: Decodable {
//    var latitude: Double
//    var longitude: Double
//}

extension LandmarkModel: Equatable {
    static func == (lhs: LandmarkModel, rhs: LandmarkModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
