//
//  loadDataFromJSON.swift
//  LandmarkJSON
//
//  Created by Артур Лутфуллин on 24.06.2021.
//

import Foundation

func loadData<T: Decodable>(with filename: String) -> T {
	guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Can't parse \(filename)") }
	
	let dataOptinal = try? Data(contentsOf: file)
	let decoder = JSONDecoder()
	do {
		guard let data = dataOptinal else { fatalError("Can't load data from \(filename)") }
		return try decoder.decode(T.self, from: data)
	} catch { fatalError("Can't decode data") }
}
