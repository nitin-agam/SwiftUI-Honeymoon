//
//  GuideComponentView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct GuideComponentView: View {
    
    let guideInfo: GuideInfo
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            
            VStack {
                Image(systemName: guideInfo.icon)
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                    .frame(width: 40, height: 40)
                
                Spacer()
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 8) {
                HStack(alignment: .center, spacing: 0) {
                    Text(guideInfo.title.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(guideInfo.subtitle.uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                }
                
                Divider().padding(.bottom, 4)
                
                Text(guideInfo.description)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponentView_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponentView(guideInfo: guideArray[0])
            .previewLayout(.sizeThatFits)
    }
}
