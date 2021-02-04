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
    var delegate:CharacterTableViewCellDelegate? = nil

    func setup(character: Character) {
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        setAvatarImage(imageUrl: String(character.thumbnail!.path) + "." + String(character.thumbnail!.extension))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//                // Configure the view for the selected state
//    }
    
    @IBAction func viewMoreButtonAction(_ sender: Any) {
        print("button")
        delegate?.goToInfoViewController()
    }
    
    private func setAvatarImage(imageUrl: String){
        avatarImage.kf.setImage(with: URL(string: imageUrl.replacingOccurrences(of: "http", with: "https")))

    }
    
}
