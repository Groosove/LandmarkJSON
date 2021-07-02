//
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit
class LandmarkDataStore: NSObject, UITableViewDataSource {
	var models: [LandmarkModel]

	init(models: [LandmarkModel] = []) {
		self.models = models
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		models.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: LandmarkTableViewCell.identifier, for: indexPath) as? LandmarkTableViewCell
		guard let landmark = cell else { return UITableViewCell() }
		landmark.accessoryType = .disclosureIndicator
		landmark.configure(with: models[indexPath.row])
		return landmark
	}
}
