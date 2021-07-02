//
//  LandmarkDescriptionViewController.swift
//  
//
//  Created by Артур Лутфуллин on 30.06.2021.
//

import UIKit

class LandmarkDescriptionViewController: UIViewController {
	var model: LandmarkModel?
	init(dataSource: [LandmarkModel], landmarkId: Int) {
		for item in dataSource where item.id == landmarkId {
			self.model = item
			break
		}
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		guard let model = self.model else { return }
		self.view = LandmarkDescriprionView(model: model)
	}
	override func viewDidLoad() {
        super.viewDidLoad()

		setUpNavigationBar()
		view.backgroundColor = .white
    }

	private func setUpNavigationBar() {
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Landmarks", style: .plain, target: nil, action: nil)
		navigationItem.title = model?.name
		navigationItem.largeTitleDisplayMode = .never
	}

}
