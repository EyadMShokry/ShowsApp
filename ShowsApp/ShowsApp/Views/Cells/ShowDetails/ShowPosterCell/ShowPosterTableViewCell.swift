//
//  ShowPosterTableViewCell.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

class ShowPosterTableViewCell: UITableViewCell {
    @IBOutlet weak var showPosterImageView: UIImageView!
    @IBOutlet weak var showGradientView: GradiantView!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var showInformationLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    var showDeatilsVC = ShowDetailsViewController()
    var categoriesArray = ["Comedy", "Science Fiction", "Action", "Drama", "Historical"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        showGradientView.AddGradiant(colors: [CGColor(red: 33/255, green: 32/255, blue: 66/255, alpha: 0), CGColor(red: 23/255, green: 19/255, blue: 29/255, alpha: 1)],
            locations: [NSNumber(floatLiteral: 0), NSNumber(floatLiteral: 1)],
            startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0))
    }
    
    @IBAction func onClickCloseButton(_ sender: UIButton) {
        showDeatilsVC.dismiss(animated: true)
    }
    
}
