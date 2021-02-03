import UIKit

class XibView: UIView {
    var xibName: String?
    
    required override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    internal func commonInit() {
        setupFromXib()
    }
    
    private func setupFromXib() {
        let xibName = self.xibName ?? String(describing: type(of: self))
        
        let viewsInXib = Bundle(for: type(of: self)).loadNibNamed(xibName, owner: self, options: nil)
        guard let view = viewsInXib?.first as? UIView else {
            return
        }
        
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            ])
        
        self.backgroundColor = UIColor.clear
    }
}

extension NSLayoutConstraint {

    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
