//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by James Best on 28/07/2023.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
