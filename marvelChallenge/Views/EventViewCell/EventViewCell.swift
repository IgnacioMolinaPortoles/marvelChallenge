//
//  EventViewCell.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 07/02/2021.
//

import UIKit

protocol EventViewCellDelegate {
    func goToEventDetail()
}

class EventViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateFromLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var dateToLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    var delegate:EventViewCellDelegate? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupStyles()
    }

    private func setupStyles() {
        containerView.layer.cornerRadius = 5
        eventImage.layer.cornerRadius = 5
        
    }
    
    func setup(event: Event){
        let currentDateTime = Date()
        titleLabel.text = event.title
        dateFromLabel.text = parseDateToString(event.start ?? currentDateTime)
        dateToLabel.text = parseDateToString(event.end ?? currentDateTime)
        setEventImage(imageUrl: String(event.thumbnail!.path) + "." + String(event.thumbnail!.extension))
    }
    
    private func parseDateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    private func setEventImage(imageUrl: String){
        eventImage.kf.setImage(with: URL(string: imageUrl.replacingOccurrences(of: "http", with: "https")))

    }
    
    @IBAction func viewMoreButton(_ sender: Any) {
        delegate?.goToEventDetail()
    }
    
}
