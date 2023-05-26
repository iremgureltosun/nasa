//
//  Date+.swift
//  StructuredConcurrency
//
//  Created by Tosun, Irem on 16.05.2023.
//

import Foundation

extension Date {
    func toString(dateFormat: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
