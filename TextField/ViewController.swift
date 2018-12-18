//
//  ViewController.swift
//  TextField
//
//  Created by liguiyang on 2018/10/31.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        myTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: view.window)
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func keyboardWillShow(notification: Notification){
        if let userInfor = notification.userInfo {
            if let rect = userInfor[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect {
                self.view.frame.origin.y = -rect.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
       self.view.frame.origin.y = 0
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

