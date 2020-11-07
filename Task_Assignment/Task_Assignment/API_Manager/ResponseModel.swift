//
//  ResponseModel.swift
//  Task_Assignment
//
//  Created by Manikanta on 06/11/20.
//

import Foundation

import Foundation

struct ResponseModel: Decodable {
    
    let title: String?
    let rows: [Content]?


    enum CodingKeys: String, CodingKey {
        case title, rows
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        title = try values.decodeIfPresent(String.self, forKey: .title)
        rows = try values.decodeIfPresent([Content].self, forKey: .rows)
    }
}
