//
//  Card.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 13.01.2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct Card: Codable {
    var pk: Int
    var name: String
    var surname: String
    var patronymic: String?
    var position: String?
    var organization: String?
    var phone: String?
    var mail: String?
    var address: String?
    var vk_url: String?
    var facebook_url: String?
    
    init() {
        self.pk = 0
        self.name = ""
        self.surname = ""
    }
}
