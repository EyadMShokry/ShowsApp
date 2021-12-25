//
//  UIView+Extension.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 25/12/2021.
//

import UIKit

extension UIView {
    
    //This method to extract year chars from a date string line 1-1-2022. It should return 2022 only
    func extractYearFrom(date: String) -> String {
        let dateStrategy = Date.ParseStrategy(format: "\(year: .defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)", timeZone: .current)
        let date = try? Date(date, strategy: dateStrategy)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date!)
    }
}
