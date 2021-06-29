//
//  Created by Artur Lutfullin on 25/06/2021.
//

import UIKit

class LandmarkTableViewCell: UITableViewCell {

    fileprivate(set) lazy var customView: UIView = {
        let view = UIView()
        return view
    }()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    func addSubviews(){
        addSubview(customView)
    }

    func makeConstraints() {
    }
}
