//
//  CharacterInfoViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 03/02/2021.
//

import UIKit

class CharacterInfoViewController: UIViewController {

    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicsTable: UITableView!
    var Character: Character?
    var comics: Comics?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = Character?.description
        
        Character?.comics?.items?.forEach{ comic in
            print(comic)
        }
        comicsTable.dataSource = self
        setupImage()
        setupTapGesture()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissVC))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    private func setupImage() {
        if let path: String = Character?.thumbnail!.path {
            print(path)
            if let ext: String = Character?.thumbnail!.extension {
                print(ext)
                avatarImage.kf.setImage(with: URL(string: (path + "." + ext).replacingOccurrences(of: "http", with: "https")))
            }
        }
    }

    @objc func dismissVC() {
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


extension CharacterInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
