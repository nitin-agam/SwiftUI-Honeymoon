//
//  ContentView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct DestinationHomeView: View {
    
    @State private var showAlert: Bool = false
    @State private var showGuide: Bool = false
    @State private var showInfo: Bool = false
    
    var body: some View {
        
        VStack {
            HomeHeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .frame(height: 80)
            
            Spacer()
            
            DestinationCardView(destination: destinationArray[1])
                .padding()
            
            Spacer()
            
            HomeFooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
          Alert(
            title: Text("SUCCESS"),
            message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
            dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct DestinationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHomeView()
    }
}
