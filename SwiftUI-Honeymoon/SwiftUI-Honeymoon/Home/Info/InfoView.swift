//
//  InfoView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct InfoView: View {
    
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
                
                Text("App Info")
                    .modifier(SectionTitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .modifier(SectionTitleModifier())
                
                CreditView()
                
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

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppInfoRowView(leftValue: "Application", rightValue: "Honeymoon")
            AppInfoRowView(leftValue: "Developer", rightValue: "Nitin Aggarwal")
            AppInfoRowView(leftValue: "Compatibility", rightValue: "iPhones & iPads")
            AppInfoRowView(leftValue: "Designer", rightValue: "Robert Petras")
            AppInfoRowView(leftValue: "Linkedin", rightValue: "/in/nitinagam")
            AppInfoRowView(leftValue: "GitHub", rightValue: "/nitin-agam")
        }
    }
}

struct CreditView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppInfoRowView(leftValue: "Photos", rightValue: "Unplash")
            
            Text("Photographers").foregroundColor(Color.gray)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
              .multilineTextAlignment(.leading)
              .lineSpacing(10)
              .font(.body)
        }
    }
}

struct AppInfoRowView: View {
    
    var leftValue: String
    var rightValue: String
    
    var body: some View {
        VStack {
            HStack {
                Text(leftValue).foregroundColor(.gray)
                Spacer()
                Text(rightValue)
            }
            Divider()
        }
    }
}
