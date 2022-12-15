//
//  Users.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import Foundation
import SwiftyJSON
import MessageKit


class User: NSObject, NSCoding,SenderType {
    
    var senderId: String = ""
    
    var displayName: String = ""
    
    
    var createdAt: String!
    var email: String!
    var id : Int!
    var name : String!
    var updatedAt: String!
    
    init(fromJson json: JSON!) {
        if json.isEmpty {
            return
        }
        createdAt = json["createdAt"].stringValue
        email = json["email"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        updatedAt = json["updatedAt"].stringValue
        
        self.senderId = String(self.id)
        
        self.displayName = self.name

    }
    
    
    
    func toDictionary() -> [String: Any] {
        
        var dictionary = [String:Any]()
        
        if createdAt != nil {
            dictionary["createdAt"] = createdAt
        }
        if email != nil {
            dictionary["email"] = email
        }
        if id != nil {
            dictionary["id"] = id
        }
        if name != nil {
            dictionary["name"] = name
        }
        if updatedAt != nil {
            dictionary["updatedAt"] = updatedAt
        }
        return dictionary
    }
    
    
    @objc required init(coder aDecoder: NSCoder) {
        
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? String

    }
    
    func encode(with aCoder: NSCoder) {
        
        if createdAt != nil {
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if email != nil {
            aCoder.encode(email, forKey: "email")
        }
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if updatedAt != nil {
            aCoder.encode(updatedAt, forKey: "updatedAt")
        }
        
    }
    
}
