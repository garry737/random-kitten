//
//  Extensions.swift
//  RandomKitten
//
//  Created by Garry Fanata on 1/24/23.
//

import Foundation
import UIKit

// Allows an image view to load an image from a URL String
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
