//
//  ChatVC.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/11/1401 AP.
//

import Foundation
import UIKit
import MessageKit
import SwiftyJSON
import InputBarAccessoryView


class ChatVC: MessagesViewController {
    
    var sender : User!
    
    var messages : [LastMessage] = []
    
    var chatId : Int!
    
    var api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getMessages()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
    }
    
    func getMessages() {

// checking the token of each user
        api = API(token: UserDefaults.standard.string(forKey: "token")!)
        api.getChatMesages(id: chatId) { json in
            for (_,message) in json["data"] {
                print(message)
                self.messages.append(LastMessage.init(fromJson: message))
            }
            
            DispatchQueue.main.async {
                self.messagesCollectionView.reloadData()
            }
        }
        
    }

}


extension ChatVC: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {

    var currentSender: SenderType {
//        return Sender(senderId: "any_unique_id", displayName: "Steven")
        return self.sender
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}

extension ChatVC : InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        if (!text.isEmpty) {
            api.sendMessage(id: self.chatId, params: ["message" : "\(text)"]) { json in
                self.messages.append(LastMessage(fromJson: json))
                DispatchQueue.main.async {
                    self.messagesCollectionView.reloadData()
                }
                inputBar.inputTextView.text = ""

                
            }
        }

        
        
    }
    
}


