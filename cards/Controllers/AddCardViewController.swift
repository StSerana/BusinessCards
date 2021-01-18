//
//  AddCardViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 17.01.2021.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet var url: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if (url.text != nil){
            Loader.addNewCard(code: url.text!)
            let alert = UIAlertController(title: "Success", message: "Контакт успешно добавлен", preferredStyle: UIAlertController.Style.alert)
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
