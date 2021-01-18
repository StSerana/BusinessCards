//
//  SettingsViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 14.01.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.backward")
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        refreshControl.addTarget(self, action: #selector(SettingsViewController.refreshData), for: UIControl.Event.valueChanged)
                refreshControl.attributedTitle = NSAttributedString(string: "Refresh Collection View", attributes: nil)
                
        // Do any additional setup after loading the view.
    }
    @objc func refreshData() {
            refreshControl.endRefreshing()
        }
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue("false", forKey: "isAuth")
        defaults.synchronize()
        print(Loader.logout())
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
