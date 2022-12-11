//
//  GuideView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct GuideView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Capsule()
                    .fill(.secondary)
                    .frame(width: 120, height: 6)
                    .opacity(0.2)
                
                Image("logo-honeymoon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .modifier(SectionTitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic honeymoon.")
                    .font(.body)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(guideArray) { item in
                        GuideComponentView(guideInfo: item)
                    }
                }
                
                Spacer(minLength: 10)
                
                Button {
                    dismiss()
                } label: {
                    Text("continue".uppercased())
                        .modifier(ContinueButtonModifier())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
        // .previewLayout(.fixed(width: 375, height: 180))
    }
}
