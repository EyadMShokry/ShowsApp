//
//  NetworkingManager.swift
//  ShowsApp
//
//  Created by Eyad Shokry on 24/12/2021.
//

import UIKit

enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(APPError)
}

class NetworkingManager {
    static let shared = NetworkingManager()
    private var imageQueue = OperationQueue()
    private var imageCache = NSCache<AnyObject, AnyObject>()

    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {

        //create the url with NSURL
        let dataURL = URL(string: url)! //change the url

        //create the session object
        let session = URLSession.shared

        //now create the URLRequest object using the url object
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                print("Network Error")
                completion(Result.failure(APPError.networkError(error!)))
                return
            }

            guard let data = data else {
                print("Data not found")
                completion(Result.failure(APPError.dataNotFound))
                return
            }

            do {
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                print("Json parsing error")
                print("Parsing Error: \(error)")
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
        })

        task.resume()
    }

}

extension NetworkingManager {
    
    func downloadImageWithUrl(imageUrl: String, completionBlock: @escaping (_ image: UIImage?)-> Void) {
        let url = URL(string: imageUrl)
        do {
            let data = try Data(contentsOf: url!)
            let newImage = UIImage(data: data)
            if newImage != nil {
                self.runOnMainThread {
                    completionBlock(newImage)
                }
            } else {
                completionBlock(nil)
            }
        } catch {
            completionBlock(nil)
        }
    }

    fileprivate func runOnMainThread(block:@escaping ()->Void) {
        if Thread.isMainThread {
            block()
        } else {
            let mainQueue = OperationQueue.main
            mainQueue.addOperation({
                block()
            })
        }
    }
}

extension NetworkingManager {
    func getFullUrl(baseUrl: String, endPoint: EndPointUrls, parameters: [String: String]? = nil) -> String {
        let urlString = "\(baseUrl)\(endPoint.rawValue)"
        var components = URLComponents()
        components.path = urlString
        components.queryItems = []
        if let params = parameters {
            for key in params.keys {
                components.queryItems?.append(URLQueryItem(name: key, value: params[key]!))
            }
            return (components.url?.absoluteString.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString)
        }
        return urlString
    }
}


