//
//  Petition.swift
//  Whitehouse Petitions
//
//  Created by Nikita  on 6/12/22.
//

import Foundation

struct Petition: Codable{
    var title: String
    var body: String
    var signatureCount: Int
}
