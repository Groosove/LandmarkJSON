//
//  LandmarkTableViewCell.swift
//  
//
//  Created by Артур Лутфуллин on 30.06.2021.
//

import UIKit

class LandmarkTableViewCell: UITableViewCell {
	static let identifier = "LandmarkCellId"
	private var isFavorite = false
	lazy var landmarkView: UIImageView = {
		var view = UIImageView()
		return view
	}()
	
	lazy var landmarkParkName: UILabel = {
		var label = UILabel()
		return label
	}()
	
	lazy var favoriteLandmark: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(systemName: "star.fill")
		return image
	}()
	
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		makeConstaint()
	}
	

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews() {
		contentView.addSubview(landmarkView)
		contentView.addSubview(landmarkParkName)
	}
	
	private func makeConstaint() {
		landmarkView.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(self.snp.top)
			make.leading.equalTo(self.snp.leading)
			make.trailing.equalTo(landmarkParkName.snp.leading)
			make.bottom.equalTo(self.snp.bottom)
			make.width.equalTo(self.snp.height)
		}
		landmarkParkName.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(self.snp.top)
			make.leading.equalTo(landmarkView.snp.trailing)
			make.trailing.equalTo(self.snp.trailing)
			make.bottom.equalTo(self.snp.bottom)
		}
	}
	
	func configure(with model: LandmarkModel) {
		landmarkView.image = model.image
		landmarkParkName.text = model.park
		isFavorite = model.isFavorite
	}

}
