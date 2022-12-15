import Foundation
import SwiftyJSON

class Chat {

    var conversationId: Int!
    var conversation : Conversation!
    var directMessage : Bool!
    var id : Int!
    var data : String!
    var privateField : Bool!
    var createdAt : String!
    var messageableId : Int!
    var messageableType : String!
    var updatedAt: String!


    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        
        let conversationJson = json["conversation"]
        if !conversationJson.isEmpty {
            conversation = Conversation(fromJson: conversationJson)
        }
        
        conversationId = json["conversation_id"].intValue
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        updatedAt = json["updated_at"].stringValue
        messageableId = json["messageable_id"].intValue
        directMessage = json["direct_message"].boolValue
        messageableType = json["messageable_type"].stringValue
        data = json["data"].stringValue
        privateField = json["private_field"].boolValue
        messageableId = json["messageable_id"].intValue
     
        
    }
}
