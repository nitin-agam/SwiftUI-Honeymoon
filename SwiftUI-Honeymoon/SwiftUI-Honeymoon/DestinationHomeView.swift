//
//  ContentView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct DestinationHomeView: View {
    
    var body: some View {
        
        DestinationCardView(destination: destinationArray[7])
    }
}

struct DestinationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHomeView()
    }
}
