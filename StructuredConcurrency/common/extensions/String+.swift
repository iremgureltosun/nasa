//
//  String+.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation

extension String {
    func toDate(dateFormat: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
}
