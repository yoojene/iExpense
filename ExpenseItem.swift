//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Eugene on 21/08/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
