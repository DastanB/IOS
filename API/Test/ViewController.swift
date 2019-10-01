//
//  ViewController.swift
//  Test
//
//  Created by erumaru on 9/19/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var result: [String] = Joke.categories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadCategories()
    }
    
    func downloadCategories() {
        Joke.downloadCategories { [weak self] categories in
            guard let self = self else { return }
            
            self.result = categories
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        let cell = tableView.cellForRow(at: indexPath) as! TitleTableViewCell
        
        vc.category = cell.titleLabel.text!
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabelViewCell", for: indexPath) as! TitleTableViewCell
        
        cell.titleLabel.text = result[indexPath.row]
        
        return cell
    }
}

