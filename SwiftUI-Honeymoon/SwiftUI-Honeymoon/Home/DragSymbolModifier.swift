//
//  DragSymbolModifier.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 14/12/22.
//

import SwiftUI

struct DragSymbolModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 120))
            .shadow(radius: 8)
    }
}
