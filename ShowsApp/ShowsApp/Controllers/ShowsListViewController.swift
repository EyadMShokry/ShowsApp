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
        showsCollectionView.dataSource = self
        showsCollectionView.delegate = self
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

extension ShowsListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        
    }
}
