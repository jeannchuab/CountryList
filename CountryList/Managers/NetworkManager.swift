//
//  API.swift
//  CountryList
//
//  Created by Jeann Luiz on 18/12/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var countries = [CountryModel]()
    
    private var urlSession = URLSession.shared
    
    let urlString = "https://restcountries.com/v3.1/all"
            
    func loadCountriesAsync() async -> [CountryModel] {
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let object = try JSONDecoder().decode([CountryModel].self, from: data)
            return object
        } catch let error {
            print("\("Error fetching data from API:") \(error)")
        }
        return []
    }
}
