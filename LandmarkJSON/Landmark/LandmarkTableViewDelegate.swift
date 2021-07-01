//
//  LandmarkTableViewDelegate.swift
//  
//
//  Created by Артур Лутфуллин on 30.06.2021.
//

import UIKit

class LandmarkTableViewDelegate: NSObject, UITableViewDelegate {
	var models: [LandmarkModel]?
	weak var delegate: LandmarkViewControllerDelegate?
	
	init (models: [LandmarkModel] = []) {
		self.models = models
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		defer { tableView.deselectRow(at: indexPath, animated: true) }
		guard let model = models?[indexPath.row] else { return }
		delegate?.landmarkDescription(id: model.id)
	}
}
