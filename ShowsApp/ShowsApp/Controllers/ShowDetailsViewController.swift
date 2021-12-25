//
//  ShowDetailsViewController.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

class ShowDetailsViewController: UIViewController {
    @IBOutlet weak var showDetailsTableView: UITableView!
    var show: Show!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        showDetailsTableView.dataSource = self
        showDetailsTableView.delegate = self
        showDetailsTableView.register(UINib(nibName: "ShowPosterTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowPosterTableViewCell")
        showDetailsTableView.register(UINib(nibName: "ShowInformationTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowInformationTableViewCell")
        showDetailsTableView.separatorColor = .clear
        showDetailsTableView.contentInsetAdjustmentBehavior = .never
        showDetailsTableView.insetsContentViewsToSafeArea = false
    }
}

extension ShowDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShowPosterTableViewCell", for: indexPath) as! ShowPosterTableViewCell
            cell.showDeatilsVC = self
            cell.configure(show: show)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShowInformationTableViewCell", for: indexPath) as! ShowInformationTableViewCell
            cell.configure(show: show)
            cell.showDeatilsVC = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 560
        }
        else {
            return UITableView.automaticDimension
        }
    }
}
