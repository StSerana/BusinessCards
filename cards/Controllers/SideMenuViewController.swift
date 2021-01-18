//
//  SideMenuViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 14.01.2021.
//

import UIKit

class SideMenuViewController: UITableViewController{

    @IBOutlet var name: UILabel!
    @IBOutlet var avatar: UIImageView!
    var reloadTimer:Timer = Timer()
    
    
    
    //let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.reloadTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
        RunLoop.main.add(self.reloadTimer, forMode: RunLoop.Mode.default)
        self.tableView.reloadData()
        viewWillAppear(true)
        // not required when using UITableViewController
        
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
            NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        name.text = Loader.getCurrentUser().name
        avatar.image = UIImage(named: "avatar")
        avatar.layer.borderWidth = 0.1
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.black.cgColor
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.clipsToBounds = true
        
            switch indexPath.row {
            case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
            case 3: NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
            //case 2: NotificationCenter.default.post(name: NSNotification.Name("ShowCards"), object: nil)
            default: break
            }
        }
    
    @objc func refresh(_ sender: AnyObject) {
        name.text = Loader.getCurrentUser().name
       // Code to refresh table view
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        name.text = Loader.getCurrentUser().name
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        name.text = Loader.getCurrentUser().name
        self.tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        refresh(self)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
