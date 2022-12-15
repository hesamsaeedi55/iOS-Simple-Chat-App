//
//  Users.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import Foundation
import SwiftyJSON
import MessageKit


class LastMessage : MessageType {
    
    
    var sender: SenderType = Sender(fromJson: JSON())
    
    var messageId : String = ""
    
    var sentDate: Date = Date()
    
    var kind: MessageKind = .text("")
    
    
    var body: String!
    var conversationId: Int!
    var createdAt: String!
    var flagged : Bool!
    var id : Int!
    var isSeen : Int!
    var deletedAt: String!
    var isSender : Int!
    var messageableId: Int!
    var messageableType: String!
    var participation : Participation!
    var participationId : Int!
    var type : String!
    var updatedAt : String!
    
    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        
        body = json["body"].stringValue
        conversationId = json["conversation_id"].intValue
        createdAt = json["created_at"].stringValue
        flagged = json["flagged"].boolValue
        id = json["id"].intValue
        isSeen = json["is_seen"].intValue
        
        let senderJson = json["sender"]
        if !senderJson.isEmpty {
            sender = Sender(fromJson: senderJson)
        }
        deletedAt = json["deleted_at"].stringValue
        isSender = json["is_sender"].intValue
        messageId = json["message_id"].stringValue
        messageableId = json["messageable_id"].intValue
        messageableType = json["messageable_type"].stringValue
        
        let participationJson = json["participation"]
        if !participationJson.isEmpty {
            participation = Participation(fromJson: participationJson)
        }
        participationId = json["participation_id"].intValue
        type = json["type"].stringValue
        updatedAt = json["updated_at"].stringValue
        
        self.kind = .text(self.body)
        
        
        }
    }

