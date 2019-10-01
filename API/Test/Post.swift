//
//  Joke.swift
//  Test
//
//  Created by erumaru on 9/25/19.
//  Copyright © 2019 KBTU. All rights reserved.
//

import Foundation
import Alamofire
import Cache

class Post: Decodable {
    var id: Int = 0
    var title: String = ""
    var body: String = ""

    init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
}
