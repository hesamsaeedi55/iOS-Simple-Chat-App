//
//  Users.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import Foundation
import SwiftyJSON

class Participation  {
    
    var conversationId: Int!
    var messageableId: Int!
    var createdAt: String!
    var messageableType: String!
    var id : Int!
    var updatedAt: String!
    
    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        
        conversationId = json["conversationId"].intValue
        createdAt = json["createdAt"].stringValue
        id = json["id"].intValue
        updatedAt = json["updatedAt"].stringValue
        messageableType = json["messageable_type"].stringValue
        messageableId = json["messageable_id"].intValue
        
    }
   
    
}
