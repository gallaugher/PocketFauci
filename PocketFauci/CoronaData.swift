//
//  CoronaData.swift
//  PocketFauci
//
//  Created by John Gallaugher on 11/23/20.
//

import Foundation

class CoronaData {
    var stateArray: [StateData] = []
    var urlString = "https://api.covidtracking.com/v1/states/current.json"
    
    func getData(completed: @escaping ()->() ) {
        print("🕸 We are accessing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        // Create a session
        let session = URLSession.shared
        
        // Get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("😡 ERROR: \(error.localizedDescription)")
            }
            
            // Deal with the data
            do {
                self.stateArray = try JSONDecoder().decode([StateData].self, from: data!)
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
}
