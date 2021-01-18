//
//  MenuListController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 13.01.2021.
//

import UIKit
import SwiftUI

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: String)
}

class MenuListController: UITableViewController {
    public var delegate: MenuControllerDelegate?
    private var items = ["Мои визитки" : "contact", "Создать новую визитку" : "plus", "Настройки" : "settings"]
    
    init() {
            super.init(nibName: nil, bundle: nil)
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "personCell")
            tableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "menuCell")
        }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.keys.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
            cell.name?.text = "Alice"
            cell.img?.image = UIImage(named: "avatar")
            cell.img?.layer.borderWidth = 0.1
            cell.img?.layer.masksToBounds = false
            cell.img?.layer.borderColor = UIColor.black.cgColor
            cell.img?.layer.cornerRadius = (cell.img?.frame.height)!/2
            cell.img?.clipsToBounds = true
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            cell.textLabel?.text = Array(items.keys)[indexPath.row - 1]
            cell.imageView?.frame =  CGRect(x: 0, y: 0, width: 40, height: 40);
            cell.imageView?.image = UIImage(named: Array(items.values)[indexPath.row - 1])
            return cell
        }
        }
        
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected menuCell #\(indexPath.item)!")
        tableView.deselectRow(at: indexPath, animated: true)
                // Relay to delegate about menu item selection
        let selectedItem = Array(items.values)[indexPath.row - 1]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
