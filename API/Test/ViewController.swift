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
    
    var result: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadPosts()
    }
    
    func downloadPosts() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        var request = try! URLRequest(url: url, method: .get)
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        Alamofire.request(request).responseData(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                let decoder = JSONDecoder()
                let posts = try! decoder.decode([Post].self, from: data)
                self.result = posts
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        let cell = tableView.cellForRow(at: indexPath) as! TitleTableViewCell
        
        vc.post = result[indexPath.row]
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabelViewCell", for: indexPath) as! TitleTableViewCell
        
        cell.titleLabel.text = result[indexPath.row].title
        
        return cell
    }
}

