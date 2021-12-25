//
//  ShowInformationTableViewCell.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

class ShowInformationTableViewCell: UITableViewCell {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var summaryLabel: UILabel!
    var showDeatilsVC = ShowDetailsViewController()
    var showLink = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        summaryLabel.sizeToFit()
    }
    
    func configure(show: Show) {
        if let link = show.show?.url {
            self.showLink = link
        }
        languageLabel.text = show.show?.language
        if let showRate = show.show?.rating?.average {
            rateLabel.text = "\(showRate)"
        }
        else {
            rateLabel.text = "N/A"
        }
        // to filter HTML tags
        summaryLabel.text = show.show?.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

    @IBAction func onClickShareButton(_ sender: UIButton) {
        if showLink != "" {
            let textToShare = "Find out this amazing show!\n"
            let objectsToShare:URL = URL(string: showLink)!
            let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,textToShare as AnyObject]
            let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.showDeatilsVC.view
            showDeatilsVC.present(activityViewController, animated: true, completion: nil)
        }
        else {
            showDeatilsVC.alertMessage(title: "Can't find the link!", userMessage: "Show link is not available.")
        }
    }
    
}
