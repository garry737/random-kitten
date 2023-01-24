//
//  CatPoster.swift
//  RandomKitten
//
//  Created by Garry Fanata on 1/24/23.
//

import Foundation
import UIKit

struct Poster {
    let imageURL: String
    let fact: String
    
    init(imgUrl: String, fact: String) {
        self.imageURL = imgUrl
        self.fact = fact
    }
}
