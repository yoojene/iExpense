//
//  ContentView.swift
//  iExpense
//
//  Created by Eugene on 19/08/2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                    
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(item.amount > 1000 ? .red : item.amount < 10 ? .green : item.amount < 100 ? .yellow : .black)
                                }
                            }
                    }
                    .onDelete(perform: removeItems)
                } header : {
                    expenses.items.count > 0 ? Text("Personal") : Text("")
                }
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                    
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(item.amount > 1000 ? .red : item.amount < 10 ? .green : item.amount < 100 ? .yellow : .black)
                                    
                            }
                        }

                    }
                    .onDelete(perform: removeItems)
                } header : {
                    expenses.items.count > 0 ? Text("Business") : Text("")
                }

            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
