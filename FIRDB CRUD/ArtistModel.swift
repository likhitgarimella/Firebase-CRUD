//
//  ArtistModel.swift
//  FIRDB CRUD
//
//  Created by Likhit Garimella on 22/04/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import Foundation

class ArtistModel {
    
    var id: String?
    var name: String?
    var genre: String?
    
    init(id: String?, name: String?, genre: String?) {
        self.id = id
        self.name = name
        self.genre = genre
    }
    
}   // #24
