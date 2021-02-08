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
    var Character: _Character?
    var comics: Comics?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        setupHeader()
        setupTapGesture()

        navigationController?.navigationBar.tintColor = UIColor.white;
    }
    
    private func setupHeader() {
        descriptionLabel.text = Character?.description

        setupImage(imageUrl: String((Character?.thumbnail!.path)!) + "." + String((Character?.thumbnail!.extension)!))
    }
    
    private func setupTable() {
        comicsTable.dataSource = self
        comicsTable.tableFooterView = UIView()
        
        let nib = UINib(nibName: "CustomSectionHeader", bundle: nil)
        comicsTable.register(nib, forHeaderFooterViewReuseIdentifier: "customSectionHeader")
        comicsTable.register(UINib(nibName: "ComicViewCell", bundle: nil), forCellReuseIdentifier: "comicViewCell")
    }
    
    private func setupImage(imageUrl: String){
        avatarImage.kf.setImage(with: URL(string: imageUrl.replacingOccurrences(of: "http", with: "https")))

    }
    private func setupTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissVC))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
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


extension CharacterInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Character?.comics?.items!.count)!
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        // Dequeue with the reuse identifier
        let header = self.comicsTable.dequeueReusableHeaderFooterView(withIdentifier: "customSectionHeader") as! CustomSectionHeader
//        if let path: String = Character?.thumbnail!.path {
//            print(path)
//            if let ext: String = Character?.thumbnail!.extension {
//                imageUrl = String(path + "." + ext).replacingOccurrences(of: "http", with: "https")
//                header.avatarImage.kf.setImage(with: URL(string: imageUrl))
//            }
//        }
        //header.subtitleLabel.text = subtitle

        return header
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comicViewCell", for: indexPath)as? ComicViewCell
        
        cell?.setup(comic: (Character?.comics?.items?[indexPath.row])!)
        return cell!
    }
    
}
