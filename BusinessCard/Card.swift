//
//  Card.swift
//  BusinessCard
//
//  Created by Piksaeva Anastasiya on 25.10.2020.
//

import SwiftUI
import CoreLocation

struct Card: Identifiable, Hashable, Codable{
    var id = UUID()
    let name: String
    let surname: String
    let patronymic: String
    let profile: String
    let description: String
    let imageName: String
}

struct Cards: Codable{
    let cards : [Card]
}

func parse() -> Cards?{
    var cards : Cards?
    /*if let path = Bundle.main.path(forResource: "cards", ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            //json = try? JSONSerialization.jsonObject(with: data)
            let decoder = JSONDecoder()
            
            if let json = try? decoder.decode(Cards.self, from: data) {
                cards = json.results
            }
            return cards;
        }catch{
            print("fail")
        }
    }*/
    if let path = Bundle.main.path(forResource: "cards", ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
                          // Getting data from JSON file using the file URL
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            let decoder = JSONDecoder()
            cards = try! decoder.decode(Cards.self, from: data)
            return cards
        } catch {
            print("fail")
        }
    }
    return cards
}

//
//  Tutor.swift
//  Tutors
//
//  Created by Sai Kambampati on 6/5/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

/*import SwiftUI

struct Tutor: Identifiable {
    var id = UUID()
    var name: String
    var headline: String
    var bio: String
    
    var imageName: String { return name }
}

#if DEBUG
let testData = [
    Tutor(name: "Sai Kambampati", headline: "Writer at AppCoda", bio: "Sai Kambampati is an app developer. He lives in Sacramento, CA and was awarded with Apple's WWDC 2017 Scholarship. Proficient in Swift and Python, it's his dream to develop an AI product."),
    Tutor(name: "Simon Ng", headline: "Founder of AppCoda", bio: "Founder of AppCoda. Author of multiple iOS prgramming books including Beginning iOS 12 Programming with Swift and Intermediate iOS 12 Programming with Swift. iOS Developer and Blogger."),
    Tutor(name: "Gabriel Theodoropoulos", headline: "Advanced Software Developer", bio: "Gabriel has been a software developer for about two decades. He has long experience in developing software solutions for various platforms in many programming languages."),
    Tutor(name: "Andrew Jaffee", headline: "Author and Software Developer", bio: "Avid and well-published author and software developer now specializing in iOS mobile app development in Obj-C and Swift. Andrew has published several apps in the Apple App Store and 30 years of experience."),
    Tutor(name: "Athena Lam", headline: "Content marketing professional", bio: "Athena is a co-founder of Business 3.0, a publication dedicated to sharing founders journeys in product and business development in East Asia. Social justice advocate."),
    Tutor(name: "Alfian Losari", headline: "Lifelong Learner", bio: "Mobile, Web, a bit of backend Software Developer and LifeLong Learner. Current building super app."),
    Tutor(name: "Lawrence Tan", headline: "Passionate iOS Developer", bio: "Lawrence is a passionate iOS Developer with over 3 years of commercial experience and had worked with clirents from US, Europe, and Asia. He's a tech addict and Swift enthusiast."),
    Tutor(name: "Kelvin Tan", headline: "Self-taught iOS Mobile Developer", bio: "Kelvin is a self taught iOS Mobile Developer who is currently active writing tutorials on his site. He is from Malaysia and speaks about 4 different languages."),
]
#endif

*/

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Group {
            Text("Hello, World!")
            Text("Hello, World!")
        }/*@END_MENU_TOKEN@*/
    }
}
