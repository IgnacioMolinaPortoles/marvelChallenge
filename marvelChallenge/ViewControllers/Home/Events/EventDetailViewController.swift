//
//  EventDetailViewController.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 07/02/2021.
//

import UIKit
import Kingfisher

class EventDetailViewController: UIViewController {

    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var comicsTable: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel?
    var comics: [Next] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGesture()
        setupContainerStyles()
        setupTable()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTable() {
        comicsTable.dataSource = self
        comicsTable.register(UINib(nibName: "ComicViewCell", bundle: nil), forCellReuseIdentifier: "comicViewCell")
    }
    
    private func setupContainerStyles() {
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 1
        containerView.layer.cornerRadius = 5
    }
    
    private func setupTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissVC))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }

    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setup (_ event: Event) {
        print(event.title!)
        //titleLabel.text = event.title
        //setEventImage(imageUrl: String(event.thumbnail!.path) + "." + String(event.thumbnail!.extension))
        
        comics = (event.comics?.items)!
    }
    
    private func setEventImage(imageUrl: String){
        eventImage.kf.setImage(with: URL(string: imageUrl.replacingOccurrences(of: "http", with: "https")))

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

extension EventDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comicViewCell", for: indexPath)as? ComicViewCell
        
        cell?.setupWithNext(comic: comics[indexPath.row])
        return cell!
    }
    
    
}
