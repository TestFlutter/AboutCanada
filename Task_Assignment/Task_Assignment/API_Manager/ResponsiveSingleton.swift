//
//  ResponsiveSingleton.swift
//  Task_Assignment
//
//  Created by Manikanta on 07/11/20.
//

import Foundation

final class ResponsiveSingleton {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = ResponsiveSingleton()
    
    var responseContentModel: [Content]?

}
