//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Sravanthi Chinthireddy on 10/01/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
//                Conditional statement with Nil coercing
//                condition ? A : B
                configuration.isPressed ?
//                A: When user pressed the button
                LinearGradient(colors: [.customGrayMedium,
                                        .customGrayLight],
                               startPoint: .top,
                               endPoint: .bottom)
                :
//                B: When user didn't press the button
                LinearGradient(colors: [.customGrayLight,
                                        .customGrayMedium],
                               startPoint: .top,
                               endPoint: .bottom))
            .clipShape(.rect(cornerRadius: 40))
    }
    
    
}
