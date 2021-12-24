//
//  GradientView.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

class GradiantView: UIView {
    private let gradient: CAGradientLayer = CAGradientLayer()
    private var colors: [CGColor] = []
    private var locations: [NSNumber] = []
    private var startPoint: CGPoint = CGPoint.zero
    private var endPoint: CGPoint = CGPoint.zero

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }

    func AddGradiant(colors: [CGColor], locations: [NSNumber], startPoint: CGPoint = CGPoint.zero, endPoint: CGPoint = CGPoint.zero) {
        self.colors = colors
        self.locations = locations
        self.startPoint = startPoint
        self.endPoint = endPoint
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
}

