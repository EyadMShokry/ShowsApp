//
//  UIViewController+Extension.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

extension UIViewController {
    func alertMessage(title: String, userMessage: String, complition: (() -> Void)? = nil) {
        let myAlert = UIAlertController(title: title, message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: UIAlertAction.Style.default, handler: { _ in
            complition?()
        })
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    func setNavigationbarBackButton() {
        let backImage = UIImage(named: "Back")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backButtonDisplayMode = .minimal
    }
}
