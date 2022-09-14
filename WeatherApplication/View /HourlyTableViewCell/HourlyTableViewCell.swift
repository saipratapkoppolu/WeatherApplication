//
//  HourlyTableViewCell.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    static let reuseIdentifer: String = "hourlyTableViewCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var hourlyViewModel: HourlyViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(
            HourlyCollectionCollectionViewCell.registerNib(),
            forCellWithReuseIdentifier: HourlyCollectionCollectionViewCell.reuseIdentifer
        )
    }
    
    func configure(hourlyViewModel: HourlyViewModel) {
        self.hourlyViewModel = hourlyViewModel
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    static func registerNib() -> UINib {
        UINib(nibName: "HourlyTableViewCell", bundle: nil)
    }
    
}

extension HourlyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyViewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionCollectionViewCell.reuseIdentifer, for: indexPath) as? HourlyCollectionCollectionViewCell
        cell?.tag = indexPath.row
        cell?.configure(hourlyViewModel: hourlyViewModel)
        return cell!
    }
}

extension HourlyTableViewCell: UICollectionViewDelegate {
    
}
