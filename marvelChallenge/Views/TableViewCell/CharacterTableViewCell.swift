//
//  CharacterTableViewCell.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 03/02/2021.
//

import UIKit
import Kingfisher

protocol CharacterTableViewCellDelegate {
    func goToInfoViewController()
}

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var CharacterAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var containerView: UIView!

    var delegate:CharacterTableViewCellDelegate? = nil

    func setup(character: _Character) {

        nameLabel.text = character.name
        descriptionLabel.text = character.description
        setAvatarImage(imageUrl: String(character.thumbnail!.path) + "." + String(character.thumbnail!.extension))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyles()
        // Initialization code
    }
    
    func setupStyles(){
        avatarImage.layer.cornerRadius = 5
        avatarImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        containerView.layer.cornerRadius = 5
        //        containerView.layer.shadowColor = UIColor.gray.cgColor
        //        containerView.layer.shadowOpacity = 1
        //        containerView.layer.shadowOffset = .zero
        //        containerView.layer.shadowRadius = 1
    }
    
    
    private func setAvatarImage(imageUrl: String){
        avatarImage.kf.setImage(with: URL(string: imageUrl.replacingOccurrences(of: "http", with: "https")))

    }
    
}
