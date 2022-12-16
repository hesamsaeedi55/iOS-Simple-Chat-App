# iOS-Simple-Chat-App
A simple ios chat application with the ability to register users, send and receive text messages, create new sessions by selecting users, with Swift programming language in XCode. Designed in SQL database with complicated structure models with Php-Laravel framework in VSCode.

# Send Message Sample

https://user-images.githubusercontent.com/118046088/207933141-7f533fda-7560-475b-b0ff-b9c279352a04.mp4

# Sign Up a User 
## accessing a TOKEN to #NEW-USER from DATABASE which allows user to make request to database (API FILE REPOSITORY OF PHP FILES OF CHAT APP) ##

https://user-images.githubusercontent.com/118046088/207933241-d9192ebc-6f5f-40b8-ba0e-88144c0cd8b5.mp4

# Sample of a class - Conversation Class 

<img width="1440" alt="Conversation Class" src="https://user-images.githubusercontent.com/118046088/208128039-238efcec-3fcc-4765-8292-f97b85ae9817.png">

# Sample of a class - Chat Class

<img width="1440" alt="Chat Class" src="https://user-images.githubusercontent.com/118046088/208128048-6246d0fc-4436-43b2-8112-ffbd888d3ac7.png">


Markup :  `code()`

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

Markup : ```swift
         ```


Markup :  `code()`

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


Markup : ```swift
         ```
