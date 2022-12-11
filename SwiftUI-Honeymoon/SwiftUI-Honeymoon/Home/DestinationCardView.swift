//
//  HomeCardView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct DestinationCardView: View {
    
    let destination: Destination
    
    var body: some View {
        Image(destination.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(24)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                VStack(alignment: .center, spacing: 12) {
                    Text(destination.country.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical, 8)
                        .shadow(radius: 5)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                        }
                    
                    Text(destination.place.uppercased())
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background {
                            Capsule().fill(.white)
                        }
                    
                }
                .foregroundColor(.white)
                .frame(minWidth: 280)
                .padding(.bottom, 50)
            }
    }
}

struct DestinationCardView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationCardView(destination: destinationArray[0])
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
