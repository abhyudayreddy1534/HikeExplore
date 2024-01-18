//
//  CustomCircleView.swift
//  Hike
//
//  Created by Sravanthi Chinthireddy on 11/01/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.customIndigoMedium,
                                              .customSalmonLight],
                                     startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                                     endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing))
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
            //            add the animate circles
                        MotionAnimationView()
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
