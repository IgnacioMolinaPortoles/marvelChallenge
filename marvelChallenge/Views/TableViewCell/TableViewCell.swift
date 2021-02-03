import UIKit


protocol TableViewCellDelegate {
    func moreButtonTapped(id:Int)
}

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"

   
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var moreButton: UIButton!
    var delegate:TableViewCellDelegate? = nil
    
    func setup(title:String) {
       
        moreButton.setTitle(title, for: .normal)
    }
    
    @IBAction func moreButtonTapped(_ sender: Any) {
        delegate?.moreButtonTapped(id: 5)
    }
    
}
