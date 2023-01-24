//
//  CatPosterViewModel.swift
//  RandomKitten
//
//  Created by Garry Fanata on 1/24/23.
//

import Foundation
import UIKit

protocol CatPosterViewModelProtocol {
    var lastCat: Int { get set }
    func getCatFact()
    func getPoster(fact: String)
}

class CatPosterViewModel: CatPosterViewModelProtocol {
    private var apiHelper: FactAPIHelper
    var lastCat: Int = 0
    weak var delegate: CatPosterViewController?
    
    init(apiHelper: FactAPIHelper = APIHelper()) {
        self.apiHelper = apiHelper
    }

    func getCatFact() {
        apiHelper.delegate = self
        apiHelper.getFact()
    }
    
    func getPoster(fact: String) {
        var randomInt = Int.random(in: 1...16)
        // so it generates a new cat everytime
        if randomInt == self.lastCat {
            randomInt = randomInt - 1
        }
        self.lastCat = randomInt
        let imageURL = Constants.imageLink.rawValue + "\(randomInt)"
        self.delegate?.updatePoster(currentPoster: (Poster(imgUrl: imageURL, fact: fact)))
    }
}
