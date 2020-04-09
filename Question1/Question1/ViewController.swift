//
//  ViewController.swift
//
//  Created by Senthil on 09/04/20.
//  Copyright © 2020 Senthil. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MsgDelegate {

    @IBOutlet var MessageTxtFld: UITextField!
    
    @IBOutlet var DisplayLbl: UILabel!
    @IBAction func SendBtn_TouchUpInside(_ sender: Any) {
        
        if MessageTxtFld.text?.isEmpty ?? true {
            
            let alert = UIAlertController(title: "Please Enter Message", message: nil,         preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                    //OK Action
                }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                   let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
                   nextViewController.receivedMsg = MessageTxtFld.text!
            nextViewController.delegate = self
                self.navigationController?.pushViewController(nextViewController, animated: true)
        }
       

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           MessageTxtFld.text = ""
       }
       

    
    func sendMessage(_ Msg: String?){
        
        DisplayLbl.text = Msg
    }
    
    

}

