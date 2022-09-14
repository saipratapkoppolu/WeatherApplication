//
//  DailyTableViewCell.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DailyTableViewCell"

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(dailyViewModel: DailyViewModel) {
        iconView.setImage(with: dailyViewModel.weatherIcon(for: tag))
        dateLabel.text = dailyViewModel.date(for: tag)
        descriptionLabel.text = dailyViewModel.getWeatherDescription(for: tag)
        temperatureLabel.text = dailyViewModel.temperature(on: tag)
    }
    
    static func registerNib() -> UINib {
        UINib(nibName: "DailyTableViewCell", bundle: nil)
    }
    
}
