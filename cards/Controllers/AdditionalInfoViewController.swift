//
//  AdditionalInfoViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 17.01.2021.
//

import UIKit

var cardId = 100
class AdditionalInfoViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var patronymicField: UITextField!
    @IBOutlet var positionField: UITextField!
    @IBOutlet var organizationField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var mailField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var vkField: UITextField!
    @IBOutlet var facebookField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var backButton: UIBarButtonItem!
    var reloadTimer:Timer = Timer()
    
    override func viewDidLoad() {
        self.reloadTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        RunLoop.main.add(self.reloadTimer, forMode: RunLoop.Mode.default)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func refreshData() {
        if let cardPk:String = UserDefaults.standard.string(forKey: "cardId"){
        let card = Loader.getCard(id: Int(cardPk)!)
            nameField.text = card.name
            surnameField.text = card.surname
            if card.position != nil {
                positionField.text = card.position
            }
            if card.vk_url != nil {
            vkField.text = card.vk_url
            }
        
        }
    }
    
    @IBAction func openVK(_ sender: Any) {
        if (vkField.text != nil){
        if let url = URL(string: vkField.text!) {
            UIApplication.shared.open(url)
        }
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
