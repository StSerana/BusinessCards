//
//  LoginViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 12.01.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        let email:String? = emailField.text;
        let password = passwordField.text;
        if (Loader.login(email: email!, password: password!)){
            let defaults = UserDefaults.standard
            defaults.setValue(email, forKey: "email")
            defaults.setValue(password, forKey: "password")
            defaults.setValue("true", forKey: "isAuth")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
