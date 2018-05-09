//
//  AppUtils.swift
//  TvPlayer
//
//  Created by Shubham Garg on 04/04/18.
//  Copyright © 2018 SHUBHAM GARG. All rights reserved.
//

import Foundation

public class AppUtils{
    //convert json object to Dictionary
    static func convertToDictionary() -> [String: Any]? {
        
        if let path = Bundle.main.path(forResource: "vimeofeed", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any]
                
            } catch {
                print(error.localizedDescription)
            }
        }
        return [:]
    }
    
}
