//
//  UserCardsViewController.swift
//  cards
//
//  Created by Piksaeva Anastasiya on 16.01.2021.
//

import UIKit

class UserCardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var reloadTimer:Timer = Timer()
    var data: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.reloadTimer = Timer(timeInterval: 0.1, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        RunLoop.main.add(self.reloadTimer, forMode: RunLoop.Mode.default)
        // Do any additional setup after loading the view.
        
    }
    
    @objc func refreshData() {
        data = Loader.getUserCards()
        self.collectionView.reloadData()
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! UserCardCollectionViewCell
        print(indexPath.row)
        cell.Credentials.text = data[indexPath.row].name + " " + data[indexPath.row].surname
        cell.status.text = data[indexPath.row].position
        cell.userImage.image = UIImage(named: "avatar")
        cell.userImage.image = UIImage(named: "avatar")
        cell.userImage.layer.borderWidth = 0.1
        cell.userImage.layer.masksToBounds = false
        cell.userImage.layer.borderColor = UIColor.black.cgColor
        cell.userImage.layer.cornerRadius = cell.userImage.frame.height/2
        cell.userImage.clipsToBounds = true
        
        cell.contentView.layer.cornerRadius = cell.contentView.frame.height/2
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        self.performSegue(withIdentifier: "showInfo", sender: self)
        refreshData()
        }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showInfo") {
            if let detailVC = segue.destination as? FormViewController {
                detailVC.nameField?.text = "sd"
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
