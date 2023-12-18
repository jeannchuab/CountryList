//
//  ContentView.swift
//  CountryList
//
//  Created by Jeann Luiz on 18/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.countries) { country in
            CountryCell(flag: country.flags.png,
                        textTitle: country.name.common,
                        textSubtitle: country.name.official,
                        textDescription: country.capital?.first ?? ""
            )
            .listRowBackground(
                RoundedRectangle(cornerRadius: 8)
                    .background(.clear)
                    .foregroundColor(.white)
                    .padding(
                        EdgeInsets(top: 2, leading: 10, bottom: 10, trailing: 10)
                    )
            )
            .listRowSeparator(.hidden)
            
        }
        .onAppear {
            Task {
                await viewModel.fetchCountries()
            }
        }
    }
}

#Preview {
    ContentView()
}
