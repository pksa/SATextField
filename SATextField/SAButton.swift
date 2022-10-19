//
//  SAButton.swift
//  SATextField
//
//  Created by Paresh Kanani on 24/06/22.
//

import UIKit

class SAButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 50)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setViews() {
        self.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)

        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.setButtonShadow()
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        self.layer.cornerRadius = self.frame.height / 2
        setNeedsDisplay()
    }
    
    private func setButtonShadow() {
        self.layer.shadowColor = UIColor(red: 104/255, green: 37/255, blue: 37/255, alpha: 0.14).cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 8)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform.identity
            }
        }
    }
}
