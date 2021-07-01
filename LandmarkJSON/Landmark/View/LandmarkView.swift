//
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit
import SnapKit

@objc protocol LandmarkViewDelegate: AnyObject {
	func doSomething()
}

class LandmarkView: UIView {
	static let identifier = "LandmarkCellId"
	weak var delegate: LandmarkViewDelegate?
	
	private lazy var isFavoriteLabel: UILabel = {
		let label = UILabel()
		label.text = "Favorites only"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
    private lazy var isFavoriteSwitch: UISwitch = {
		let isFavoriteSwitch = UISwitch()
		isFavoriteSwitch.isOn = false
		isFavoriteSwitch.translatesAutoresizingMaskIntoConstraints = false
		isFavoriteSwitch.addTarget(delegate, action: #selector(delegate?.doSomething), for: .touchUpInside)
        return isFavoriteSwitch
    }()
	
	private var tableView = UITableView.init(frame: .zero, style: .plain)
	
	init(delegate: LandmarkViewDelegate) {
		tableView.register(LandmarkTableViewCell.self, forCellReuseIdentifier: LandmarkTableViewCell.identifier)
		super.init(frame: UIScreen.main.bounds)
		backgroundColor = .white
		self.delegate = delegate
		addSubviews()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
    func addSubviews(){
		addSubview(isFavoriteLabel)
        addSubview(isFavoriteSwitch)
		addSubview(tableView)
    }

    func makeConstraints() {
		isFavoriteLabel.snp.makeConstraints { (make) -> Void in
			make.leading.equalTo(layoutMarginsGuide.snp.leading)
			make.top.equalTo(safeAreaLayoutGuide.snp.top)
			make.bottom.equalTo(tableView.snp.top)
			make.trailing.equalTo(isFavoriteSwitch.snp.leading)
			make.height.equalTo(44)
		}
		
		isFavoriteSwitch.snp.makeConstraints { (make) -> Void in
			make.leading.equalTo(isFavoriteLabel.snp.trailing)
			make.top.equalTo(safeAreaLayoutGuide.snp.top)
			make.bottom.equalTo(tableView.snp.top)
			make.trailing.equalTo(layoutMarginsGuide.snp.trailing)
			make.height.equalTo(44)
		}
		
		tableView.snp.makeConstraints { (make) -> Void in
			make.bottom.equalTo(self.layoutMarginsGuide.snp.bottom)
			make.leading.equalTo(self.snp.leading)
			make.trailing.equalTo(self.snp.trailing)
		}
    }
	
	func getSwitchValue() -> Bool {
		return isFavoriteSwitch.isOn
	}
	
	func updateTableViewData(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.reloadData()
	}
}
