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
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	lazy var landmarkParkName: UILabel = {
		var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	lazy var favoriteLandmark: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(systemName: "star.fill")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.tintColor = .systemYellow
		image.contentMode = .center
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
		contentView.addSubview(favoriteLandmark)
	}

	override func layoutSubviews() {
		landmarkView.layer.cornerRadius = landmarkView.frame.width / 2
		landmarkView.clipsToBounds = true
	}

	private func makeConstaint() {
		landmarkView.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(self.snp.top)
			make.leading.equalTo(layoutMarginsGuide.snp.leading).offset(-5)
			make.trailing.equalTo(landmarkParkName.snp.leading).offset(-10)
			make.bottom.equalTo(self.snp.bottom).offset(-5)
			make.width.equalTo(self.snp.height).offset(-5)
		}

		landmarkParkName.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(self.snp.top)
			make.bottom.equalTo(self.snp.bottom)
		}

		favoriteLandmark.snp.makeConstraints { (make) -> Void in
				make.top.equalTo(self.snp.top)
				make.leading.equalTo(landmarkParkName.snp.trailing)
				make.bottom.equalTo(self.snp.bottom)

			}
	}

	func configure(with model: LandmarkModel) {
		landmarkView.image = model.image
		landmarkParkName.text = model.name
		isFavorite = model.isFavorite
		if isFavorite {
			favoriteLandmark.isHidden = false
		}
		prepareForReuse()
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		if !isFavorite {
			favoriteLandmark.isHidden = true
		}
	}
}
