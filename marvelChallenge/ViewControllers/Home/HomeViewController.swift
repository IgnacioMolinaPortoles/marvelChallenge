//
//  homeViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 02/02/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    var email = ""

    var character: [Character] = []
    var pagination = 1
    
    @IBOutlet weak var fetchActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usersTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        usersTable.dataSource = self
        usersTable.delegate = self
        usersTable.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableCell")
        
        fetchActivityIndicator.hidesWhenStopped = true
        fetchActivityIndicator.startAnimating()
        
        NetworkingProvider.shared.getSuperheroes(pagination:pagination) { (Character) in
                self.character = Character
                self.usersTable.reloadData()
                self.fetchActivityIndicator.stopAnimating()
        } failure: { (error) in
            self.fetchActivityIndicator.stopAnimating()
        }

    }
    
    private func setupTableView() {
        
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(character[indexPath.row])
        
        goToInfoViewController()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
//
//        if cell === nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
//        }
        
        //cell!.textLabel?.text = character[indexPath.row].name
        
        if indexPath.row == character.count-1 { //you might decide to load sooner than -1 I guess..
            self.pagination += 1

            NetworkingProvider.shared.getSuperheroes(pagination: self.pagination) { (Character) in
                var _CharactersTemp: [Character] = self.character
                Character.forEach{ char in
                    _CharactersTemp.append(char)
                }
                
                self.character = _CharactersTemp
                self.usersTable.reloadData()
                self.fetchActivityIndicator.stopAnimating()
            } failure: { (error) in
                self.fetchActivityIndicator.stopAnimating()
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableCell", for: indexPath)as? CharacterTableViewCell
        if indexPath.row == 0 {
            print(character[indexPath.row])
        }
        cell?.delegate = self
        //cell.setup(characted: character[indexPath.row])
        
        
        cell?.nameLabel.text = character[indexPath.row].name
        cell?.descriptionLabel.text = character[indexPath.row].description
        cell?.setAvatarImage(imageUrl: String(character[indexPath.row].thumbnail!.path) + "." + String(character[indexPath.row].thumbnail!.extension))
        
        
        return cell!
    }
    
}

extension HomeViewController: CharacterTableViewCellDelegate {
    func goToInfoViewController() {
        //delegate
        NavigatorHelper.sharedInstance.goToInfoViewController(originVc: self)
    
    }

}

//extension HomeViewController: TableViewCellDelegate {
////    func moreButtonTapped(id: Int) {
////        print(id)
////    }
//}

