//
//  FirstViewController.swift
//
//  Created by Senthil on 09/04/20.
//  Copyright © 2020 Senthil. All rights reserved.
//

import UIKit

protocol MsgDelegate: class {
    func sendMessage(_ Msg: String?)
}

class FirstViewController: UIViewController {

    @IBOutlet var Message2TxtFld: UITextField!
    @IBOutlet var message2Lbl: UILabel!
    var receivedMsg : String?
    
    weak var delegate: MsgDelegate?

    
    @IBAction func SendBtn_TouchUpInside(_ sender: Any) {
        
        
        if Message2TxtFld.text?.isEmpty ?? true {
                  
                  let alert = UIAlertController(title: "Please Enter Message", message: nil,         preferredStyle: UIAlertController.Style.alert)
                  alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                          //OK Action
                      }))
                  self.present(alert, animated: true, completion: nil)
                  
              }else{
            
            delegate?.sendMessage(Message2TxtFld.text!)
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()

        if receivedMsg != nil {
            message2Lbl.text = receivedMsg
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Message2TxtFld.text = ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
