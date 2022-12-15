//
//  Messageable.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/9/1401 AP.
//

import Foundation
import SwiftyJSON

class Messageable {

    var createdAt: String!
    var email : String!
    var id : Int!
    var name : String!
    var participation : [Participation]!
    var updatedAt: String!


    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        email = json["email"].stringValue
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        updatedAt = json["updated_at"].stringValue
        name = json["name"].stringValue
        let participationArray = json["participation"].arrayValue
        participation = [Participation]()
        for participationJson in participationArray {
            let value = Participation(fromJson: participationJson)
            participation.append(value)
        }
        
    }
}
