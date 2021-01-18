//
//  StatusMessage.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 16.01.2021.
//

import Foundation

class StatusMessage: Codable
{
    var status:Bool
    var card_id:Int?
    var user:String?
    
    init() {
        status = false
    }
}
