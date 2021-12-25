//
//  ShowsListViewController.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

class ShowsListViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var showsCollectionView: UICollectionView!
    var searchWord = ""
    let showsArray = ["Ant Man", "Spider Man", "Future Man", "Batman", "La Casa De Papel", "Preson Break", "The Blacklist"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        showsCollectionView.dataSource = self
        showsCollectionView.delegate = self
        showsCollectionView.register(UINib(nibName: "ShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShowCollectionViewCell")
        searchTextField.setLeftPaddingPoints(amount: 24)
        setNavigationbarBackButton()
    }
    
    private func navigateToShowDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showsListVC = storyboard.instantiateViewController(withIdentifier: "ShowsListViewController") as! ShowsListViewController
        showsListVC.searchWord = searchTextField.text ?? ""
        self.navigationController?.pushViewController(showsListVC, animated: true)
    }
    
    @IBAction func onClickSearchButton(_ sender: UIButton) {
        
    }
    

}

extension ShowsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let showCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCollectionViewCell", for: indexPath) as! ShowCollectionViewCell
        showCell.configure(showName: self.showsArray[indexPath.row])
        return showCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showDetailsVC = storyboard.instantiateViewController(withIdentifier: "ShowDetailsViewController") as! ShowDetailsViewController
        showDetailsVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        showDetailsVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(showDetailsVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = 8.0
        let width = showsCollectionView.frame.width/2
        let height = showsCollectionView.frame.height/2.5
        return CGSize(width: width-padding, height: height)
    }
}
