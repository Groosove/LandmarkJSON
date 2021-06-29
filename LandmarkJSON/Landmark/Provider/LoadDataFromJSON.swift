//
//  Created by Artur Lutfullin on 25/06/2021.
//

import Foundation

protocol LoadDataFromJSONProtocol {
	func loadData(with filename: String, completion: @escaping ([LandmarkModel]?, Error?) -> Void)
}

class LoadDataFromJSON: LoadDataFromJSONProtocol {
	func loadData(with filename: String, completion: @escaping ([LandmarkModel]?, Error?) -> Void) {
		guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { completion(nil, Landmark.LandmarkError.parseError(message: "\(filename) is uncorrect")); return }
		
		let dataOptinal = try? Data(contentsOf: file)
		let decoder = JSONDecoder()
		do {
			guard let data = dataOptinal else { completion(nil, Landmark.LandmarkError.decodeError(message: "Couldn't parse data from \(filename)")); return }
			let model: [LandmarkModel] = try decoder.decode([LandmarkModel].self, from: data)
			completion(model, nil)
		} catch { completion(nil, Landmark.LandmarkError.parseError(message: "Can't decode data to LandmarkModel")) }
	}
	
	
}

