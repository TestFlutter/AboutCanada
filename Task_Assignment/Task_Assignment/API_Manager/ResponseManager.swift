//
//  ResponseManager.swift
//  Task_Assignment
//
//  Created by Manikanta on 06/11/20.
//

import Foundation

class ResponseManager: NSObject {
    
    class func callItemsList(CompletionHandeler: @escaping ((_ gotData: String) -> Void)) {
        DispatchQueue.main.async {
            guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else { return }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    let utf8Data = String(decoding: data!, as: UTF8.self).data(using: .utf8)
                    
                    let decoder = JSONDecoder()
                    let checkData = try decoder.decode(ResponseModel.self, from: utf8Data!)
                    ResponsiveSingleton.shared.responseContentModel = checkData.rows
                    CompletionHandeler(checkData.title ?? "")
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
            task.resume()
        }
    }
    
    
}


