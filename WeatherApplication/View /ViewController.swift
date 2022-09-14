//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let refreshControl = UIRefreshControl()
    private var lastUpdated: String?
    
    
    let viewModel: WeatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        activityIndicator.startAnimating()
        viewModel.fetchWeather { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.delegate = self
            self?.tableView.reloadData()
            self?.activityIndicator.stopAnimating()
            self?.lastUpdated = self?.viewModel.lastUpdated
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(HourlyTableViewCell.registerNib(), forCellReuseIdentifier: HourlyTableViewCell.reuseIdentifer)
        tableView.register(DailyTableViewCell.registerNib(), forCellReuseIdentifier: DailyTableViewCell.reuseIdentifier)
        tableView.addSubview(refreshControl)
        
    }
    
    @IBAction func cityChanged(_ sender: UISegmentedControl) {
        refresh()
    }
    
    @objc func refresh() {
        activityIndicator.startAnimating()
        
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            viewModel.currentLocation = .beijing
        case 2:
            viewModel.currentLocation = .losAngeles
        default:
            viewModel.currentLocation = .rioDeJaneiro
        }
        
        viewModel.fetchWeather { [weak self] in
            self?.tableView.reloadData()
            self?.activityIndicator.stopAnimating()
            self?.refreshControl.endRefreshing()
            self?.lastUpdated = self?.viewModel.lastUpdated
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.reuseIdentifer, for: indexPath) as? HourlyTableViewCell
            cell?.configure(hourlyViewModel: viewModel.hourlyViewModel)
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.reuseIdentifier, for: indexPath) as? DailyTableViewCell
        cell?.tag = indexPath.row
        cell?.configure(dailyViewModel: viewModel.dailyViewModel)
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 56))
        headerView.backgroundColor = .white
        let titleLabel = UILabel(frame: CGRect(x: 12, y: 16, width: tableView.frame.width, height: 40))
        titleLabel.text = viewModel.getSectionTitle(for: section)
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.textColor = .black
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
             return nil
        }
        return "Last updated on \(Date().day) \(Date().time)"
    }
}
