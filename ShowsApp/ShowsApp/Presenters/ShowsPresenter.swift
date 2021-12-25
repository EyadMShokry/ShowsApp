//
//  ShowsPresenter.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import Foundation

protocol ShowsPresenterDelegate: AnyObject {
    func showLoader()
    func hideLoader()
    func success(response: [Show]?)
    func fail(error: String?)
}

class ShowPresenter {
    var delegate: ShowsPresenterDelegate?
    
    func searchShows(query: String) {
        delegate?.showLoader()
        let parameters = ["q" : query]
        let url = NetworkingManager.shared.getFullUrl(baseUrl: BaseUrls.tvmazeDomain, endPoint: .searchShows, parameters: parameters)
        NetworkingManager.shared.dataRequest(with: url, objectType: [Show].self) { (result: Result) in
            DispatchQueue.main.async {
                self.delegate?.hideLoader()
                switch result {
                case .success(let object):
                    self.delegate?.success(response: object)
                case .failure(let error):
                    self.delegate?.fail(error: error.localizedDescription)
                }
            }
        }
    }
}
