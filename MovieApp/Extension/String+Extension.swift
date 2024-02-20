//
//  String+Extension.swift
//  MovieApp
//
//  Created by Sahan Ravindu on 05/12/2023.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
