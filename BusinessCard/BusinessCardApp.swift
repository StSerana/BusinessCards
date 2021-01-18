//
//  BusinessCardApp.swift
//  BusinessCard
//
//  Created by Piksaeva Anastasiya on 14.10.2020.
//

import SwiftUI

@main
struct BusinessCardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct BusinessCardApp_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center){
            Image("icon")
                .clipShape(Circle())
            Text("Альфа - Визитка")
                .foregroundColor(.red)
                .font(.title)
                .multilineTextAlignment(.center)
        }
    }
}
