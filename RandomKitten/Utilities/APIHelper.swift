//
//  APIHelper.swift
//  RandomKitten
//
//  Created by Garry Fanata on 1/24/23.
//

import Foundation
import UIKit

protocol FactAPIHelper {
    var delegate: CatPosterViewModel? { get set }
    func getFact()
}

class APIHelper: FactAPIHelper {
    weak var delegate: CatPosterViewModel?

    func getFact(){
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: Constants.factLink.rawValue)!) { [weak self] data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, [String]>
                let fact = json["data"]?[0] ?? "Cats are cute"
                self?.delegate?.getPoster(fact: fact)
            } catch {
                print("error: \(error)")
            }
        }
        task.resume()
    }
}

