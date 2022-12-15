//
//  API.swift
//  chatapp
//
//  Created by Hesamoddin Saeedi on 9/7/1401 AP.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    
    let base = "http://localhost:8000/api"
    
    var token = ""
    
    init(token:String = "" ) {
        
        self.token = token
    }
    
    
    func register(params: [String : String], callback: @escaping (JSON)->()) {
        
        let url = base + "/register"
        
        let headers : HTTPHeaders = [
        
            "Accept" : "application/json"
        
        ]
        
        AF.request(url,method: .post, parameters: params,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
        }
        
        
    }
    
    func login(params: [String : String], callback: @escaping (JSON)->()) {
        
        let url = base + "/login"
        
        let headers : HTTPHeaders = [
        
            "Accept" : "application/json"
        
        ]
        
        AF.request(url,method: .post, parameters: params,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
        }
        
        
    }
    
    func createChat(params: [String : String], callback: @escaping (JSON)->()) {
        
        let url = base + "/chat"
        
        let headers : HTTPHeaders = [
        
            "Accept" : "application/json",
            "Authorization" : "Bearer \(token)"
        
        ]
        
        AF.request(url,method: .post, parameters: params,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
        }
        
        
    }
    
    
    func sendMessage(id: Int ,params: [String : String], callback: @escaping (JSON)->()) {
        
        let url = base + "/chat/\(id)/send"
        
        let headers : HTTPHeaders = [
        
            "Accept" : "application/json",
            "Authorization" : "Bearer \(token)"
        
        ]
        
        AF.request(url,method: .post, parameters: params,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
        }
        
        
    }
    
    func getChats(callback: @escaping (JSON)->()) {
        
        let url = base + "/chat"
        
        let headers : HTTPHeaders = [
        
            "Accept" : "application/json",
            "Authorization" : "Bearer \(token)"
        
        ]
        
        AF.request(url,method: .get,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
        }
        
        
    }
    
    func getChatMesages(id: Int , callback: @escaping (JSON)->()) {
        
        let url = base + "/chat/\(id)/messages"
        
        let headers : HTTPHeaders = [
        
            "Accept" : "application/json",
            "Authorization" : "Bearer \(token)"
        
        ]
        
        AF.request(url,method: .get,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
        }
        
        
    }
    
    
    
    func getUsers( callback: @escaping (JSON)->()) {
        
        let url = base + "/users"
        
        let headers : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(token)"
        ]
        
        AF.request(url,method: .get,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
             
        }
        
        
    }
    
    func getUser( callback: @escaping (JSON)->()) {
        
        let url = base + "/user"
        
        let headers : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(token)"
        ]
        
        AF.request(url,method: .get,headers: headers).responseJSON { (response) in callback(JSON(response.value as Any))
            
            
            
             
        }
        
        
    }
    
}
