# iOS-Simple-Chat-App
A simple ios chat application with the ability to register users, send and receive text messages, create new sessions by selecting users, with Swift programming language in XCode. Designed in SQL database with complicated structure models with Php-Laravel framework in VSCode.

# Send Message Sample

https://user-images.githubusercontent.com/118046088/207933141-7f533fda-7560-475b-b0ff-b9c279352a04.mp4

# Sign Up a User and accessing a TOKEN to #NEW-USER from DATABASE which allows user to make request to database (API FILE REPOSITORY OF PHP FILES OF CHAT APP)

https://user-images.githubusercontent.com/118046088/207933241-d9192ebc-6f5f-40b8-ba0e-88144c0cd8b5.mp4

# Sample of a class - Conversation Class 

<img width="1440" alt="Conversation Class" src="https://user-images.githubusercontent.com/118046088/208128039-238efcec-3fcc-4765-8292-f97b85ae9817.png">

# Sample of a class - Chat Class

<img width="1440" alt="Chat Class" src="https://user-images.githubusercontent.com/118046088/208128048-6246d0fc-4436-43b2-8112-ffbd888d3ac7.png">

Markup :  `code()`


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

Markup : ```swift
         ```
