//
//  ViewModel.swift
//  CountryList
//
//  Created by Jeann Luiz on 18/12/23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var countries = [CountryModel]()
    
    func fetchCountries() async {
        countries = await NetworkManager().loadCountriesAsync().sorted(by: { $0.name.common < $1.name.common })        
    }
}
