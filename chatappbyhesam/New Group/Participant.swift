import Foundation
import SwiftyJSON

class Participant {

    var conversationId: Int!
    var createdAt : String!
    var id : Int!
    var data : String!
    var messageable : Messageable!
    var messageableId : Int!
    var messageableType : String!
    var setting : AnyObject!
    var updatedAt: String!


    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        conversationId = json["conversationId"].intValue
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        messageableId = json["messageable_id"].intValue
        let messageableJson = json["messageable"]
        if !messageableJson.isEmpty {
            messageable = Messageable(fromJson: messageableJson)
        }
        messageableType = json["messageable_type"].stringValue
        data = json["data"].stringValue
        messageableId = json["messageable_id"].intValue
        updatedAt = json["updated_at"].stringValue

        
    }
}
