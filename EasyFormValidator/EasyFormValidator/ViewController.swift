//
//  ViewController.swift
//  EasyFormValidator
//
//  Created by JohnLui on 15/8/5.
//  Copyright © 2015年 JohnLui. All rights reserved.
//

import UIKit

extension UIButton {
    func disable() {
        self.enabled = false
        self.alpha = 0.5
    }
    func enable() {
        self.enabled = true
        self.alpha = 1
    }
}

extension UITextField {
    var notEmpty: Bool{
        get {
            return self.text != ""
        }
    }
    func validate(RegEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluateWithObject(self.text)
    }
    func validateEmail() -> Bool {
        return self.validate("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
    }
    func validatePhoneNumber() -> Bool {
        return self.validate("^\\d{11}$")
    }
    func validatePassword() -> Bool {
        return self.validate("^[A-Z0-9a-z]{6,18}")
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.disable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editingChanged(sender: AnyObject) {
        if self.emailTextField.notEmpty && self.phoneNumberTextField.notEmpty && self.passwordTextField.notEmpty {
            self.loginButton.enable()
        } else {
            self.loginButton.disable()
        }
    }
    @IBAction func loginButtonBeTapped(sender: AnyObject) {
        if self.emailTextField.validateEmail() {
            if self.phoneNumberTextField.validatePhoneNumber() {
                if self.passwordTextField.validatePassword() {
                    self.alert("验证成功！")
                } else {
                    self.alert("密码格式不合法")
                }
            } else {
                self.alert("手机号格式不合法")
            }
        } else {
            self.alert("邮箱格式不合法")
        }
    }

    func alert(message: String) {
        let alc = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alc.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alc, animated: true, completion: nil)
    }

}

