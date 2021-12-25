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
    @IBOutlet weak var summaryButton: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onClickShareButton(_ sender: UIButton) {
        
    }
    
}
