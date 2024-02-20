//
//  AddMovieScreen.swift
//  MovieApp
//
//  Created by Sahan Ravindu on 05/12/2023.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var year: Int?
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
    
    var body: some View {
        Form {
            
            TextField(text: $title) {
                Text("Title")
            }
            TextField("Year", value: $year, format: .number)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading, content: {
                Button("Close") {
                    dismiss()
                }
            })
            
            ToolbarItem(placement: .topBarTrailing, content: {
                Button("Save") {
                    
                    guard let year = year else { return }
                    
                    let movie = Movie(title: title, year: year)
                    context.insert(movie)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                    
                }.disabled(!isFormValid)
            })
            
        })
    }
}

#Preview {
    
    NavigationStack {
        AddMovieScreen()
            .modelContainer(for: [Movie.self])
    }
}
