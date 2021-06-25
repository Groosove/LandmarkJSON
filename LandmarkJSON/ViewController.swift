//
//  ViewController.swift
//  LandmarkJSON
//
//  Created by Артур Лутфуллин on 24.06.2021.
//

import UIKit

class ViewController: UIViewController {

	var landmarks = [Landmark]()
	private lazy var tableView: UITableView = {
		let tableView = UITableView(frame: self.view.frame)
		
		tableView.tableFooterView = UIView()
		return tableView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(tableView)
		view.backgroundColor = .orange
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return landmarks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: LandmarkViewCellPresenter.identifier) as! LandmarkViewCellPresenter
		return cell
	}
	
}

