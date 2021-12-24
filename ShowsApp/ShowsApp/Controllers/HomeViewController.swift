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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setAnimationView()
        searchTextField.setLeftPaddingPoints(amount: 14.0)
        setNavigationbarBackButton()
    }

    private func setAnimationView() {
        animatioView.contentMode = .scaleAspectFit
        animatioView.loopMode = .loop
        animatioView.animationSpeed = 1
        animatioView.play()
    }
    
    private func navigateToShowsList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showsListVC = storyboard.instantiateViewController(withIdentifier: "ShowsListViewController") as! ShowsListViewController
        showsListVC.searchWord = searchTextField.text ?? ""
        self.navigationController?.pushViewController(showsListVC, animated: true)
    }

    @IBAction func onClickSearchButton(_ sender: UIButton) {
        if searchTextField.text == nil || searchTextField.text == "" {
            self.alertMessage(title: "Empty Field!", userMessage: "Please, fill the search field to continue")
        }
        else {
            view.endEditing(true)
            navigateToShowsList()
        }
    }
    
    
}

