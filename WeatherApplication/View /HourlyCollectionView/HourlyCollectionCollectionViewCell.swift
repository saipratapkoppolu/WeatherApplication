//
//  HourlyCollectionCollectionViewCell.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import UIKit

class HourlyCollectionCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifer = "hourlyCollectionViewCell"
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(hourlyViewModel: HourlyViewModel) {
        temperatureLabel.text = hourlyViewModel.temperature(at: tag)
        humidityLabel.text = hourlyViewModel.humidity(at: tag)
        iconView.setImage(with: hourlyViewModel.weatherIcon(for: tag))
        timeLabel.text = hourlyViewModel.time(of: tag)
    }
    
    static func registerNib() -> UINib {
        UINib(nibName: "HourlyCollectionCollectionViewCell", bundle: nil)
    }
}
