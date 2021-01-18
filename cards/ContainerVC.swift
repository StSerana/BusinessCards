//
//  ContainerVC.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 14.01.2021.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
        var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)

        // Do any additional setup after loading the view.
    }
    @objc func toggleSideMenu() {
            if sideMenuOpen {
                sideMenuOpen = false
                sideMenuConstraint.constant = -240
                
            } else {
                sideMenuOpen = true
                sideMenuConstraint.constant = 0
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
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
