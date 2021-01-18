//
//  FormViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 16.01.2021.
//

import UIKit

class FormViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        var cardData:  [String : String] = [:]
        if (!nameField.text!.isEmpty){
            cardData["name"] = nameField.text!}
        if (!surnameField.text!.isEmpty){
            cardData["surname"] = surnameField.text!}
        if (!patronymicField.text!.isEmpty){
            cardData["patronymic"] = patronymicField.text!}
        if (!organizationField.text!.isEmpty){
            cardData["organization"] = organizationField.text!}
        if (!phoneField.text!.isEmpty){
            cardData["phone"] = phoneField.text!}
        if (!mailField.text!.isEmpty){
            cardData["mail"] = mailField.text!}
        if (!addressField.text!.isEmpty){
            cardData["address"] = addressField.text!}
        if (!vkField.text!.isEmpty){
            cardData["vk_url"] = vkField.text!}
        if (!facebookField.text!.isEmpty){
            cardData["facebook_url"] = facebookField.text!}
        Loader.saveCards(params: cardData)
        //Loader.saveCards(params: cardData)
        self.dismiss(animated: true, completion: nil)
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
