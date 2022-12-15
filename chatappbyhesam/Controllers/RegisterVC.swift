//
//  ViewController.swift
//  chatappbyhesam
//
//  Created by Hesamoddin Saeedi on 9/7/1401 AP.
//

import UIKit

class RegisterVC: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    let api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

    }
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
        guard let name = nameField.text ,let email = emailField.text , let pass = passField.text else {
            print("fill all the fields")
            return
        }
        
        
        api.register(params: ["name" : name, "email" : email, "password" : pass ]) { json in
            
            print(name)
            print(email)
            print(pass)
            
            if (json["errors"].exists() ) {
        
                print(json["errors"])
                return
                
            }
            
                let token = json["token"].stringValue
            print(token)
                let userDefault = UserDefaults.standard
                userDefault.set(token,forKey: "token")
                userDefault.synchronize()
                print(token)
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatsVC") as! ChatsVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc,animated: true,completion: nil)
                
            
            }
        }
    
    
    
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let email = emailField.text , let pass = passField.text else {
            return
        }
        
        api.login(params: [ "email" : email, "password" : pass ]) { json in
            
            print(email)
            print(pass)
            
            if (json["error"].exists() ) {
               
                print(json["error"])
                
                return
            }
 
            //save token
            let token = json["token"].stringValue
            print(token)
            let userDefault = UserDefaults.standard
            userDefault.set(token,forKey: "token")
            userDefault.synchronize()
            print(token)
            
            //go to main page
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatsVC") as! ChatsVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: true,completion: nil)
            
            
            
            
            }
    }
    

    
}

