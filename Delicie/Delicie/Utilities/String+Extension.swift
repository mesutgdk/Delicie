//
//  String+Extension.swift
//  Delicie
//
//  Created by Mesut Gedik on 22.12.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
