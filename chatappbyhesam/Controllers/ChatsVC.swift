//
//  ChatsVC.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import UIKit
import SwiftyJSON

class ChatsVC: UITableViewController, UINavigationControllerDelegate {
    
    var api : API = API()
    
    var chats : [Chat] = [Chat]()
    var user : User!
    
    override func viewWillAppear(_ animated: Bool) {
        
        let button1 = UIBarButtonItem(title: "Users", style: .plain, target: self, action: #selector(self.addClicked))
        
        self.navigationItem.rightBarButtonItem = button1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api = API(token: UserDefaults.standard.string(forKey: "token")!)
        
        
        getData()
        
    }
    
    func getData() {
        
        
        api.getUser { (json) in
            self.user = User.init(fromJson: json)
            print(json)
            
        }
        
        api.getChats { (json) in
            
            for(_,subJson) in json["data"] {
                self.chats.append(Chat.init(fromJson: subJson))
                print(json)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @objc   func addClicked() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UsersVC") as! UsersVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.chats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let chat = self.chats[indexPath.row]
        
        
         
        
        if (chat.conversation != nil && chat.conversation.lastMessage != nil ) {
            cell.detailTextLabel?.text = chat.conversation.lastMessage.body
        }
        
        if(self.user != nil ) {
            for person in chat.conversation.participant {
                if(person.messageableId != self.user.id) {
                    print("we found the other person")
                    cell.textLabel?.text = person.messageable.name
                }
            }
        }
        
        
        
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chat = self.chats[indexPath.row]
        
        let vc = ChatVC()
        vc.sender = self.user
        vc.chatId = chat.id
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
}
