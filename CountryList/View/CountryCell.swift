//
//  CountryCell.swift
//  CountryList
//
//  Created by Jeann Luiz on 18/12/23.
//

import SwiftUI

struct CountryCell: View {
    @State var flag = ""
    @State var textTitle = ""
    @State var textSubtitle = ""
    @State var textDescription = ""
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: flag)) { image in
                    image
                        .image?.resizable()
                        .scaledToFit()
                }
                .padding()
            }
            .frame(width: 120, height: 120, alignment: .center)
                        
            VStack(alignment: .leading) {
                Text(textTitle)
                    .font(.headline)
                
                Text(textSubtitle)
                    .font(.subheadline)
                
                Text(textDescription)
                    .font(.footnote)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CountryCell()
}
