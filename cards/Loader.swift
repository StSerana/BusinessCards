//
//  Loader.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 12.01.2021.
//

import Foundation

class Loader
{
    private static let base:String = "http://localhost:8000"
    private static let card:String = "/cards/"
    private static let log_in:String = "/login/"
    private static let current:String = "get_current/"
    private static let log_out:String = "/logout/"
    private static let save_card:String = "/create/"
    private static let user_list:String = "/user_list/"
    private static let share:String = "/share/"
    private static var currUser = Card()
    
    private static var loggedIn:Bool = false
    private static var loggedOut:Bool = false
    public static var cards:[Card] = []
    private static var cardInfo:Card = Card()
    public static var userCards:[Card] = []
    public static var currentUser:Card {
        get{
            return currUser
        }
        set(card){
            currUser = card
        }
    }
    private static func getSaveResult(message:String, data:Data?) -> Void {
        
    }
    
    private static func getLoginResult(message:String, data:Data?) -> Void {
        self.loggedIn = message == "Success"
    }
    
    private static func getLogoutResult(message:StatusMessage, data:Data?) -> Void {
        self.loggedOut = message.status
    }
    
    private static func getCardsResult(message:StatusMessage, data:Data?) -> Void {
        if (data != nil){
            if let array = try? JSONDecoder().decode([Card].self, from: data!)  {
                self.cards = array
                print(cards)
                print(cards.count)
            }
        }
    }
    
    private static func getCardResult(message:StatusMessage, data:Data?) -> Void {
        if (data != nil){
            if let card = try? JSONDecoder().decode(Card.self, from: data!)  {
                self.cardInfo = card
                print(cardInfo)
            }
        }
    }
    
    private static func getUserCardsResult(message:StatusMessage, data:Data?) -> Void {
        if (data != nil){
            if let array = try? JSONDecoder().decode([Card].self, from: data!)  {
                self.userCards = array
                print(userCards)
                print(userCards.count)
            }
        }
    }
    
    private static func getCurrentUserResult(message:StatusMessage, data:Data?) -> Void {
        if (data != nil){
            if let card = try? JSONDecoder().decode(Card.self, from: data!)  {
                self.currentUser = card
                print(currentUser)
            }
            else {
                UserDefaults.standard.setValue("false", forKeyPath: "isAuth")
            }
        }
    }
    public static func getCurrentUser() -> Card {
        let url = base + card + current
        let params:[String:Any] = [:]
        callGet(url: url, params: params, finish: getCurrentUserResult)
        print(currentUser)
        return currentUser
    }
    public static func isUserAuth() -> Bool{
        let url = base + card + current
        let params:[String:Any] = [:]
        callGet(url: url, params: params, finish: getCurrentUserResult)
        print(url)
        return currentUser.pk != 0
    }
    
    public static func saveCards(params: [String : String]){
        let url = URL(string: base + save_card)
        print(url!)
        callPost(url: url!, params: params as [String : String], base: false, finish: getSaveResult)
    }
    
    public static func getUserCards()->[Card]
    {
        let url = base + user_list
        print (url)
        let params:[String:Any] = [:]
        callGet(url: url, params: params, finish: getUserCardsResult)
        return self.userCards
    }
    
    public static func getCard(id:Int)->Card
    {
        let url = base + card + String(id)
        print (url)
        let params:[String:Any] = [:]
        callGet(url: url, params: params, finish: getCardResult)
        return self.cardInfo
    }
    
    public static func getCards()->[Card]
    {
        let url = base + card
        print (url)
        let params:[String:Any] = [:]
        callGet(url: url, params: params, finish: getCardsResult)
        return self.cards
    }
    
    public static func logout() -> Bool{
        let url = base + log_out
        print (url)
            let params:[String:Any] = [:]
        callGet(url: url,params: params, finish: getLogoutResult)
        callGet(url: url,params: params, finish: getLogoutResult)
            print (self.loggedOut)
        return self.loggedOut
    }
    
    public static func addNewCard(code:String){
        let url = base + share + code
        print (url)
        let params:[String:Any] = [:]
        callGet(url: url,params: params, finish: getLogoutResult)
    }
    
    public static func login(email:String, password:String)->Bool
    {
        let url = URL(string: base + log_in)!
        print (url)
        let credentials:[String:Any] = [
            "username":email,
            "password":password
        ]
            callPost(url: url, params: credentials, base: false, finish: getLoginResult)
            print(loggedIn)
        
        return loggedIn
    }
   
    
    static func getPostString(params:[String:Any]) -> String
        {
            var data = [String]()
            for(key, value) in params
            {
                data.append(key + "=\(value)")
            }
            return data.map { String($0) }.joined(separator: "&")
        }

    static func callGet(url:String, params: [String:Any], finish: @escaping ((message:StatusMessage, data:Data?))->Void){
        var components = URLComponents(string: url)!
            components.queryItems = params.map { (key, value) in
                URLQueryItem(name: key, value: value as? String)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)

        var result:(message:StatusMessage, data:Data?) = (message: StatusMessage(), data: nil)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let message = try? JSONDecoder().decode(StatusMessage.self, from: data!)  {
            result.message = message
            print(message.status)
           }
            result.data = data
            finish(result)
        }
        task.resume()

    }
    static func callPost(url:URL, params:[String:Any], base:Bool, finish: @escaping ((message:String, data:Data?)) -> Void)
        {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
        if base {
            request.allHTTPHeaderFields = [ "Accept": "application/json", "Content-Type" :"application/json"]
        }
            let postString = self.getPostString(params: params)
            request.httpBody = postString.data(using: .utf8)

            var result:(message:String, data:Data?) = (message: "Fail", data: nil)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in

                if(error != nil)
                {
                    result.message = "Fail Error not null : \(error.debugDescription)"
                }
                else
                {
                    result.message = "Success"
                    result.data = data
                }

                finish(result)
            }
            task.resume()
        }
}
