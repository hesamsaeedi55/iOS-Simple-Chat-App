//
//  UserVC.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/8/1401 AP.
//

import UIKit
import SwiftyJSON

class UsersVC: UITableViewController {
    
    var api = API()
    var users :[User] = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api = API(token: UserDefaults.standard.string(forKey: "token")!)
        print(UserDefaults.standard.string(forKey: "token")!)
        getData()
        
    }
    
    func getData() {
        
        

        api.getUsers { (json) in
            for(_,subJson) in json {
                let usr = User.init(fromJson: subJson)
                self.users.append(usr)
                print(json)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.users.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let user = self.users[indexPath.row]
        
        cell.textLabel?.text = user.name
        
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = self.users[indexPath.row]
        
        api.createChat(params: ["user_id" : "\(user.id!)"]) { (json) in
            
            print(json)
            
            
        }
        
    }

}
