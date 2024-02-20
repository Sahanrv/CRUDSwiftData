//
//  MoviewDetailScreen.swift
//  MovieApp
//
//  Created by Sahan Ravindu on 06/12/2023.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentationMode
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    
    var body: some View {
        Form {
            TextField(text: $title) {
                Text("Title")
            }
            TextField("Year", value: $year, format: .number)
            Spacer()
            HStack {
                Spacer()
                
                Button("Update") {
                    guard let year = year else { return }
                    
                    movie.title = title
                    movie.year = year
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }.buttonStyle(.borderless)
                    .foregroundColor(.blue)
                
                Spacer()
            }
            .listRowSeparator(.hidden)
            .frame(height: 35)
            .overlay(
                RoundedRectangle(cornerRadius: 8) // Adjust the corner radius as needed
                    .stroke(Color.blue, lineWidth: 0.5)
            )
            
            Spacer()
        }.onAppear(perform: {
            title = movie.title
            year = movie.year
        })
    }
}

struct MovieDetailContainerScreen: View {
    
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    
    var body: some View {
        ZStack {
            if let movie {
                MovieDetailScreen(movie: movie)
            }
            
        }.onAppear(perform: {
            movie = Movie(title: "SpiderMan", year: 2023)
            context.insert(movie!)
        })
    }
}

#Preview {
    MovieDetailContainerScreen()
        .modelContainer(for: [Movie.self])
    
}
