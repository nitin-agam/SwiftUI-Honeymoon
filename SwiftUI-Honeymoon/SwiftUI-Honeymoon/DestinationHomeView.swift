//
//  ContentView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct DestinationHomeView: View {
    
    var body: some View {
        
        VStack {
            
            HomeHeaderView()
                .frame(height: 80)
            
            Spacer()
            
            DestinationCardView(destination: destinationArray[1])
                .padding()
            
            Spacer()
            
            HomeFooterView()
        }
    }
}

struct DestinationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHomeView()
    }
}
