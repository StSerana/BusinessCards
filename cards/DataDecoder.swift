//
//  DataDecoder.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 13.01.2021.
//

import Foundation

func decode<T: Decodable>(_ json: Data) -> T {
    
    /*guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }*/
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: json)
    } catch {
        fatalError("Couldn't parse as \(T.self):\n\(error)")
    }
}
