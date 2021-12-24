//
//  HomeViewController.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    @IBOutlet weak var animatioView: AnimationView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private func setAnimationView() {
        animatioView.contentMode = .scaleAspectFit
        animatioView.loopMode = .loop
        animatioView.animationSpeed = 1
        animatioView.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setAnimationView()
        searchTextField.setLeftPaddingPoints(amount: 14.0)
    }

    @IBAction func onClickSearchButton(_ sender: UIButton) {
        
    }
    
    
}

