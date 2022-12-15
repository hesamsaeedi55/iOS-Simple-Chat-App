//
//  Users.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import Foundation
import SwiftyJSON
import MessageKit

class Sender: SenderType {
    
    var senderId: String = ""
    
    var displayName: String = ""
    
    
    var email: String!
    var createdAt: String!
    var participation : Participation!
    var name: String!
    var id : Int!
    var updatedAt: String!
    
    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        
        name = json["name"].stringValue
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        updatedAt = json["updated_at"].stringValue
        email = json["email"].stringValue
        let participationJson = json["participation"]
        if !participationJson.isEmpty {
            participation = Participation(fromJson: participationJson)
        }
        
        self.senderId = String(self.id)
        self.displayName = self.name

    }
}
