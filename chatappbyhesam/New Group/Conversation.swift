//
//  Users.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import Foundation
import SwiftyJSON


class Conversation: NSObject{
    
    var directMessage: Bool!
    var lastMessage: LastMessage!
    var createdAt: String!
    var participant: [Participant]!
    var id : Int!
    var privateField : Bool!
    var updatedAt: String!
    
    
    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        
       
        directMessage = json["direct_message"].boolValue
        let lastMessageJson = json["last_message"]
        if !lastMessageJson.isEmpty {
            lastMessage = LastMessage(fromJson: lastMessageJson)
        }
        
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        
        participant = [Participant]()
        
        let participantArray = json["participants"].arrayValue
        for participationJson in participantArray {
            let value = Participant(fromJson: participationJson)
            participant.append(value)
        }
        
        privateField = json["private_field"].boolValue
        updatedAt = json["updated_at"].stringValue

        
    }
    
    
}
