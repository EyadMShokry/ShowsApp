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
    private let showsPresenter = ShowPresenter()
    private var showsArray: [Show] = []
    var searchWord = ""

    override func viewWillAppear(_ animated: Bool) {
        showsPresenter.searchShows(query: searchWord)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsPresenter.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        showsCollectionView.dataSource = self
        showsCollectionView.delegate = self
        showsCollectionView.register(UINib(nibName: "ShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShowCollectionViewCell")
        searchTextField.setLeftPaddingPoints(amount: 24)
        searchTextField.text = searchWord
        setNavigationbarBackButton()
    }
    
    @IBAction func onClickSearchButton(_ sender: UIButton) {
        if searchTextField.text == nil || searchTextField.text == "" {
            self.alertMessage(title: "Empty Field!", userMessage: "Please, fill the search field to continue")
        }
        else {
            view.endEditing(true)
            showsPresenter.searchShows(query: self.searchTextField.text ?? "")
        }
    }
}

extension ShowsListViewController: ShowsPresenterDelegate {
    func showLoader() {
        showSpinner(onView: view)
    }
    
    func hideLoader() {
        removeSpinner(fromView: view)
    }
    
    func success(response: [Show]?) {
        self.showsArray = response ?? []
        self.performUIUpdatesOnMain {
            self.showsCollectionView.restore()
            self.showsCollectionView.reloadData()
            if self.showsArray.isEmpty {
                self.showsCollectionView.setEmptyMessage("There are no search results")
            }
        }
    }
    
    func fail(error: String?) {
        print("Error: \(error)")
        self.showsArray = []
        self.performUIUpdatesOnMain {
            self.showsCollectionView.reloadData()
            self.showsCollectionView.setEmptyMessage("An Error Happened. Please, try again later")
        }
    }
}

extension ShowsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        showsArray.isEmpty ? collectionView.setEmptyMessage("There are no search results") : collectionView.restore()
        return showsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let showCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCollectionViewCell", for: indexPath) as! ShowCollectionViewCell
        showCell.configure(show: self.showsArray[indexPath.item])
        return showCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showDetailsVC = storyboard.instantiateViewController(withIdentifier: "ShowDetailsViewController") as! ShowDetailsViewController
        showDetailsVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        showDetailsVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        showDetailsVC.show = showsArray[indexPath.item]
        self.present(showDetailsVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = 8.0
        let width = showsCollectionView.frame.width/2
        let height = showsCollectionView.frame.height/2.5
        return CGSize(width: width-padding, height: height)
    }
}
