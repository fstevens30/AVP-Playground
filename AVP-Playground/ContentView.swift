//
//  ContentView.swift
//  AVP-Playground
//
//  Created by Flynn Stevens on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var catFact: String = "Press the button for a cat fact"

    var body: some View {
        VStack {
            Text("Welcome to the Cat Fact Generator.")
                .font(.title)
            Text(catFact)
                .padding()
            Button("Tell me a fact.") {
                fetchCatFact()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
    }
    
    func fetchCatFact() {
        let url = URL(string: "https://meowfacts.herokuapp.com/")
        
        let task = URLSession.shared.dataTask(with: url!) {data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(CatFactResponse.self, from: data)
                    DispatchQueue.main.async {
                        if let firstFact = response.data.first {
                            self.catFact = firstFact
                        }
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else if let error = error {
                print("Failed to fetch data: \(error)")
            }
        }
        task.resume()
    }
}

struct CatFactResponse: Codable {
    let data: [String]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
