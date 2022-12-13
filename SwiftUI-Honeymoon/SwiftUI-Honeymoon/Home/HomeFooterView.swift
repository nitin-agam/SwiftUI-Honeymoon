//
//  HomeFooterView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct HomeFooterView: View {
    
    @Binding var showBookingAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            .tint(.primary)
            
            Spacer()

            Button {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.footnote)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Capsule().stroke(.pink, lineWidth: 2))
                    
            }
            .tint(.pink)
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
            .tint(.primary)
        }
        .padding()
    }
}

struct HomeFooterView_Previews: PreviewProvider {
    
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        HomeFooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
