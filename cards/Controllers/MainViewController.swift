//
//  MainViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 12.01.2021.
//

import UIKit
import SideMenu

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var sideMenu: SideMenuNavigationController?
    
    var data: [Card] = []
    let refreshControl = UIRefreshControl()
    var reloadTimer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(MainViewController.refreshData), for: UIControl.Event.valueChanged)
                refreshControl.attributedTitle = NSAttributedString(string: "Refresh Collection View", attributes: nil)
        self.reloadTimer = Timer(timeInterval: 2.0, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        RunLoop.main.add(self.reloadTimer, forMode: RunLoop.Mode.default)
        collectionView.refreshControl = refreshControl
                    //collectionView.addSubview(refreshControl)
        NotificationCenter.default.addObserver(self,
                                                       selector: #selector(showProfile),
                                                       name: NSNotification.Name("ShowProfile"),
                                                       object: nil)
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(showSettings),
                                                       name: NSNotification.Name("ShowSettings"),
                                                       object: nil)
                //NotificationCenter.default.addObserver(self,
                  //                                     selector: #selector(showSignIn),
                    //                                   name: NSNotification.Name("ShowCards"),
                      //                                 object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showInfo),
                                               name: NSNotification.Name("showInfo"),
                                               object: nil)
       refreshData()
    }
    @objc func showProfile() {
            performSegue(withIdentifier: "ShowProfile", sender: self)
        }
        
        @objc func showSettings() {
            performSegue(withIdentifier: "ShowSettings", sender: nil)
        }
        
        @objc func showSignIn() {
            performSegue(withIdentifier: "ShowCards", sender: nil)
        }
    @objc func showInfo() {
        performSegue(withIdentifier: "showInfo", sender: nil)
    }
        
        
    @IBAction func onMoreTapped() {
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        present(sideMenu!, animated: true)
    }
    
    @objc func refreshData() {
            data = Loader.getCards()
        self.collectionView.reloadData()
        refreshControl.endRefreshing()
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        let isAuth:String? = UserDefaults.standard.string(forKey: "isAuth")
        if (!Loader.isUserAuth())
        {
                self.performSegue(withIdentifier: "loginView", sender: self)
        }else{
            self.collectionView.reloadData()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Loader.getCards().count)
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cards = data
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        print(indexPath.row)
        cell.Credentials.text = cards[indexPath.row].name + " " + cards[indexPath.row].surname
        print(cards[indexPath.row].name)
        cell.status.text = cards[indexPath.row].position
        cell.userImage.image = UIImage(named: "avatar")
        cell.userImage.layer.borderWidth = 0.1
        cell.userImage.layer.masksToBounds = false
        cell.userImage.layer.borderColor = UIColor.black.cgColor
        cell.userImage.layer.cornerRadius = cell.userImage.frame.height/2
        cell.userImage.clipsToBounds = true
        
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        //refreshData()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        data = Loader.getCards()
        data = Loader.getCards()
        let defaults = UserDefaults.standard
        defaults.setValue(data[indexPath.row].pk, forKey: "cardId")
        defaults.synchronize()
        print("aaaaa" + String(data[0].pk))
        cardId = data[indexPath.row].pk
        cardId = data[indexPath.row].pk
        self.performSegue(withIdentifier: "AdditionalView", sender: nil)
        refreshData()
        }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
