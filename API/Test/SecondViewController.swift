//
//  SecondViewController.swift
//  Test
//
//  Created by erumaru on 9/19/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Variables
    var category: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJoke()
    }
    
    // MARK: - Methods
    func downloadJoke() {
        Joke.downloadJoke(for: category) { [weak self] joke in
            guard let self = self else { return }
            
            self.titleLabel.text = joke.value
        }
    }
}
