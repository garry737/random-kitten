//
//  PosterView.swift
//  RandomKitten
//
//  Created by Garry Fanata on 1/24/23.
//

import Foundation
import UIKit

class PosterView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var factText: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    func commoninit() {
        Bundle.main.loadNibNamed("PosterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
}
