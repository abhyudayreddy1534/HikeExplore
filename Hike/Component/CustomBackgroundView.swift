//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Sravanthi Chinthireddy on 10/01/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    private let cornerRadius: CGFloat = 40
    var body: some View {
        ZStack {
//            MARK: - 3. Depth
            Color.customGreenDark
                .clipShape(.rect(cornerSize: CGSize(width: cornerRadius,
                                                    height: cornerRadius)))
                .offset(CGSize(width: 0.0, height: 12.0)) // or you can give .offset(y:12)
            
//            MARK: - 2. Light
            Color.colorGreenLight
                .clipShape(.rect(cornerSize: CGSize(width: cornerRadius,
                                                     height: cornerRadius)))
                .offset(y:3)
                .opacity(0.85)
            
//            MARK: - 1. Surface
            LinearGradient(colors: [Color.colorGreenLight,
                                    Color.colorGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: cornerRadius,
                                                               bottomLeading: cornerRadius,
                                                               bottomTrailing: cornerRadius,
                                                           topTrailing: cornerRadius)))
        }
        
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
