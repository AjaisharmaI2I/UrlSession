//
//  ViewModel.swift
//  Session
//
//  Created by Ideas2IT on 19/07/23.
//

import Foundation
import UIKit
import CoreData

class SessionViewModel {
    let apiUrl = "https://newsapi.org/v2/everything?q=tesla&from=2023-06-21&sortBy=publishedAt&apiKey=cd19a89dd229476998dd1c422eed946e"

    func fetchAPIResponse(myCompletionHandler: @escaping ((_ status: Bool,_ articals: [Article]?)->())) {
        
        guard let url = URL(string: apiUrl) else {
            print("Looks like no url is present")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {jsonData, response, error in
            if let error =  error  {
                print("Error \(error.localizedDescription)")
                return
            }
            
//            if let data = jsonData {
//                do {
//                    if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? NSDictionary {
//
//                        print(jsonResponse)
//                        if let jsonobj = jsonResponse.value(forKey: "articles") as? [[String: Any]] {
//                            for json in jsonobj {
//
//                                let artical = MyArticals()
//                                if let articalTitle = json["title"] as? String {
//                                    artical.articalTitle = articalTitle
//                                }
//
//                                if let articalDesc = json["description"] as? String {
//                                    artical.articalDescription = articalDesc
//                                }
//
    //                                self.articalsList.append(artical)
//                            }
//                            myCompletionHandler(true, self.articalsList)
//                        }
//                    }
//                } catch {
//                    print("Error in parsing json data")
//                    myCompletionHandler(false, nil)
//                }
//            }
            
            if let data = jsonData {
                do {
                    let decoder = JSONDecoder()
                    let myarticals = try decoder.decode(CodableArticals.self, from: data)
                    myCompletionHandler(true, myarticals.articles)
                } catch {
                    print(error)
                }
            }
        })
        task.resume()
    }
}
