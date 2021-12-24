//
//  ShowCollectionViewCell.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit
import Cosmos

class ShowCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var showInformationLabel: UILabel!
    @IBOutlet weak var showRatingView: CosmosView!
    @IBOutlet weak var showGradinetView: GradiantView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showGradinetView.AddGradiant(colors: [CGColor(red: 33/255, green: 32/255, blue: 66/255, alpha: 0), CGColor(red: 33/255, green: 32/255, blue: 66/255, alpha: 1)],
            locations: [NSNumber(floatLiteral: 0), NSNumber(floatLiteral: 1)],
            startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0))
    }
    
    func configure(showName: String) {
        self.showNameLabel.text = showName
    }
}
