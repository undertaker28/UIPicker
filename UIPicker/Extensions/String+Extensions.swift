//
//  String+Extensions.swift
//  UIPicker
//
//  Created by Pavel on 11.12.22.
//

import Foundation

extension String {
    func localized(_ language: String) -> String {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
