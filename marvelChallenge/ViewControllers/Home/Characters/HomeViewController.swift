//
//  homeViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 02/02/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    var character: [_Character] = []
    var pagination = 1
    
    @IBOutlet weak var fetchActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usersTable: UITableView!

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupTable()
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]

        self.title = "Personajes"

        usersTable.isHidden = true
        fetchActivityIndicator.hidesWhenStopped = true
        fetchActivityIndicator.startAnimating()
        
        getCharacters(pag:pagination)

    }
    
    private func setupTable(){
        usersTable.dataSource = self
        usersTable.delegate = self
        usersTable.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableCell")
    }
    
    func getCharacters(pag:Int){
        NetworkingProvider.shared.getSuperheroes(pagination: pag) { (Character) in
            var _CharactersTemp: [_Character] = self.character
            if(pag != 1){
                _CharactersTemp = self.character
                Character.forEach{ char in
                    _CharactersTemp.append(char)
                }
            } else {
                _CharactersTemp = Character
            }
            
            
            self.character = _CharactersTemp
            self.usersTable.isHidden = false
            self.usersTable.reloadData()
            self.fetchActivityIndicator.stopAnimating()
        } failure: { (error) in
            self.fetchActivityIndicator.stopAnimating()
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(character[indexPath.row])
        NavigatorHelper.sharedInstance.goToInfoViewController(originVc: self, characterInfo: character[indexPath.row])
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
        
        if indexPath.row == character.count-5 {
            
            self.pagination += 1

            getCharacters(pag:self.pagination+1)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableCell", for: indexPath)as? CharacterTableViewCell

        cell?.delegate = self
        
        cell?.setup(character: character[indexPath.row])
        
        return cell!
    }
    
}

extension HomeViewController: CharacterTableViewCellDelegate {
    func goToInfoViewController() {
        //delegate
        //NavigatorHelper.sharedInstance.goToInfoViewController(originVc: self)
    
    }

}

//extension HomeViewController: TableViewCellDelegate {
////    func moreButtonTapped(id: Int) {
////        print(id)
////    }
//}

