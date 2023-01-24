//
//  CatPosterViewController.swift
//  RandomKitten
//
//  Created by Garry Fanata on 1/24/23.
//

import Foundation
import UIKit

class CatPosterViewController: UIViewController {
    @IBOutlet weak var posterView: PosterView!
    var posterVM = CatPosterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        posterView.addGestureRecognizer(tap)
        posterView.isUserInteractionEnabled = true
        posterVM.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewModel()
    }
    
    func updateViewModel() {
        self.posterVM.getCatFact()
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        updateViewModel()
    }

    func updatePoster(currentPoster: Poster) {
        DispatchQueue.main.async {
            self.posterView.imageView.loadFrom(URLAddress: currentPoster.imageURL)
            self.posterView.factText.text = currentPoster.fact
        }
    }
}
