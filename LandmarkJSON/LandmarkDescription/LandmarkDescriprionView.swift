//
//  LandmarkDescriprionView.swift
//  LandmarkJSON
//
//  Created by Артур Лутфуллин on 01.07.2021.
//

import UIKit
import SnapKit
import MapKit

class LandmarkDescriprionView: UIView {
	let model: LandmarkModel
	lazy var mapViewLandmark: MKMapView = {
		let annotation = MKPointAnnotation()
		let map = MKMapView(frame: CGRect(origin: .zero,
										  size: CGSize(width: self.frame.width, height: self.frame.height / 3)))
		annotation.title = model.name
		annotation.coordinate = model.coordinate
		map.setRegion(MKCoordinateRegion(center: model.coordinate,
										 latitudinalMeters: 50000,
										 longitudinalMeters: 60000), animated: true)
		map.centerCoordinate = model.coordinate
		map.mapType = .standard
		map.addAnnotation(annotation)
		map.isScrollEnabled = true
		map.translatesAutoresizingMaskIntoConstraints = false
		return map
	}()

	lazy var landmarkImage: UIImageView = {
		let image = UIImageView(image: model.image)
		image.layer.cornerRadius = image.frame.size.width / 2
		image.clipsToBounds = true
		image.layer.borderWidth = 3.0
		image.layer.borderColor = UIColor.white.cgColor
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()

	lazy var landmarkNameLabel: UILabel = {
		let label = UILabel()
		label.text = model.name
		label.font = UIFont.preferredFont(forTextStyle: .title1)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	lazy var landmarkParkLabel: UILabel = {
		let label = UILabel()
		label.text = model.park
		label.font = UIFont.preferredFont(forTextStyle: .subheadline)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	lazy var landmarkCityLabel: UILabel = {
		let label = UILabel()
		label.text = model.state
		label.textAlignment = .right
		label.font = UIFont.preferredFont(forTextStyle: .subheadline)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	lazy var landmarkDescriptionLabel: UILabel = {
		var label = UILabel()
		label.text = model.description
		label.numberOfLines = 0
		label.sizeToFit()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let scrollView = UIScrollView()

	init(model: LandmarkModel) {
		self.model = model
		super.init(frame: UIScreen.main.bounds)
		addSubviews()
		makeConstraints()
	}

	private func makeConstraints() {
		landmarkImage.snp.makeConstraints { (make) -> Void in
			make.centerX.equalTo(self.snp.centerX)
			make.centerY.equalTo(self.snp.centerY).offset(-landmarkImage.bounds.height / 2)
		}

		landmarkNameLabel.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(landmarkImage.snp.bottom).offset(10)
			make.leading.equalTo(layoutMarginsGuide.snp.leading)
			make.trailing.equalTo(layoutMarginsGuide.snp.trailing)
		}

		landmarkParkLabel.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(landmarkNameLabel.snp.bottom)
			make.leading.equalTo(layoutMarginsGuide.snp.leading)
		}

		landmarkCityLabel.snp.makeConstraints { (make) -> Void in
			make.leading.equalTo(landmarkParkLabel.snp.trailing)
			make.trailing.equalTo(layoutMarginsGuide.snp.trailing)
			make.top.equalTo(landmarkParkLabel.snp.top)
		}

		scrollView.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(landmarkCityLabel.snp.bottom)
			make.leading.equalTo(layoutMarginsGuide.snp.leading)
			make.trailing.equalTo(layoutMarginsGuide.snp.trailing)
			make.bottom.equalTo(self.snp.bottom)
		}

		landmarkDescriptionLabel.snp.makeConstraints { (make) -> Void in
			make.top.equalTo(scrollView.snp.top)
			make.leading.equalTo(scrollView.snp.leading)
			make.trailing.equalTo(scrollView.snp.trailing)
			make.bottom.equalTo(scrollView.snp.bottom)
			make.width.equalTo(scrollView.snp.width)
		}

	}

	private func addSubviews() {
		addSubview(mapViewLandmark)
		addSubview(landmarkImage)
		addSubview(landmarkNameLabel)
		addSubview(landmarkParkLabel)
		addSubview(landmarkCityLabel)
		addSubview(scrollView)
		scrollView.addSubview(landmarkDescriptionLabel)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
