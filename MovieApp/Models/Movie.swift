//
//  Movie.swift
//  MovieApp
//
//  Created by Sahan Ravindu on 05/12/2023.
//

import Foundation
import SwiftData

@Model
final class Movie {
//    @Attribute(.unique) var title: String ///If you need to unique your title
    var title: String
    var year: Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}

extension Movie: PersistentModel {}

extension Movie: Observable {}
