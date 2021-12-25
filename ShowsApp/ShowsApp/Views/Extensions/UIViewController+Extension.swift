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
        
    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }
}


private let spinnerTag = 101010101014510
extension UIViewController {
    func showSpinner(onView: UIView, backColor: UIColor = UIColor.black.withAlphaComponent(0)) {
        DispatchQueue.main.async {
            let spinnerView = UIView(frame: onView.bounds)
            spinnerView.backgroundColor = backColor
            //
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            blurEffectView.clipsToBounds = true
            blurEffectView.center = spinnerView.center
            spinnerView.addSubview(blurEffectView)
            //
            var ai = UIActivityIndicatorView()
            if #available(iOS 13, *) {
                ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            } else {
                ai = UIActivityIndicatorView(style: .whiteLarge)
            }
            ai.color = .white
            ai.startAnimating()
            ai.center = spinnerView.center

            spinnerView.addSubview(ai)
            spinnerView.tag = spinnerTag
            if onView.viewWithTag(spinnerTag) == nil {
                onView.addSubview(spinnerView)
            }
            onView.isUserInteractionEnabled = false
        }
    }

    func removeSpinner(fromView: UIView) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            var loader: UIView? = fromView.viewWithTag(spinnerTag)
            UIView.animate(withDuration: 0.2, animations: {
                loader?.alpha = 0
            }, completion: { _ in
                fromView.isUserInteractionEnabled = true
                loader?.removeFromSuperview()
                loader = nil
            })
        }
    }

}
