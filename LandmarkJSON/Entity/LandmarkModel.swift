//
//  LandmarkModel.swift
//  LandmarkJSON
//
//  Created by Артур Лутфуллин on 24.06.2021.
//

import UIKit
import CoreLocation

struct Landmark: Decodable {
	var name: String
	var category: String
	var city: String
	var id: Int
	var park: String
	private var coordinates: Coordinates
	private var imageName: String
	
	var image: UIImage { UIImage(imageLiteralResourceName: imageName) }
	var coordinate: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude) }
}

struct Coordinates: Decodable {
	var latitude: Double
	var longitude: Double
}
