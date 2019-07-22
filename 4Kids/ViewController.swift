//
//  ViewController.swift
//  4Kids
//
//  Created by Холманский Максим on 22/07/2019.
//  Copyright © 2019 Kholmansky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private let estimateWidth: CGFloat = 160.0
	private let cellMarginSize: CGFloat = 16.0
	private let color: UIColor

	private let layout = UICollectionViewFlowLayout()
	private lazy var collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)

	init(with color: UIColor){
		self.color = color
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.collectionView.backgroundColor = .clear

		self.view.addSubview(self.collectionView)



		self.collectionView.delegate = self
		self.collectionView.dataSource = self

		self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

		self.setupGridView()

		self.collectionView.translatesAutoresizingMaskIntoConstraints = false
		self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
		self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
		self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		self.setupGridView()
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}
}

extension ViewController: UICollectionViewDataSource
{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

		cell.contentView.backgroundColor = self.color

		return cell
	}


}

extension ViewController: UICollectionViewDelegateFlowLayout
{
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = self.calculateWith()
		return CGSize(width: width, height: width)
	}
}

private extension ViewController
{
	func calculateWith() -> CGFloat {
		let estimatedWidth = CGFloat(estimateWidth)
		let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))

		let margin = CGFloat(cellMarginSize * 2)
		let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount

		return width
	}

	func setupGridView() {
		self.layout.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
		self.layout.minimumLineSpacing = CGFloat(self.cellMarginSize)
	}
}
