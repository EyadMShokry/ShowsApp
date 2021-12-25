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
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var showRatingView: CosmosView!
    @IBOutlet weak var showGradinetView: GradiantView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showGradinetView.AddGradiant(colors: [CGColor(red: 33/255, green: 32/255, blue: 66/255, alpha: 0), CGColor(red: 33/255, green: 32/255, blue: 66/255, alpha: 1)],
            locations: [NSNumber(floatLiteral: 0), NSNumber(floatLiteral: 1)],
            startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0))
        self.layer.cornerRadius = 8
    }
        
    private func setRateView(rate: Double) {
        self.showRatingView.rating = rate/2
    }
    
    func configure(show: Show) {
        self.showNameLabel.text = show.show?.name
        self.showInformationLabel.text = "\(extractYearFrom(date: show.show?.ended ?? "2020-04-03")) • \(show.show?.averageRuntime ?? show.show?.runtime ?? 0) mins"
        setRateView(rate: show.show?.rating?.average ?? 0.0)
        if let url = URL(string: show.show?.image?.medium ?? "https://via.placeholder.com/150"){
          showImageView.load(url: url)
        }
    }
}
