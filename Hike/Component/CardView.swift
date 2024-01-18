//
//  CardView.swift
//  Hike
//
//  Created by Sravanthi Chinthireddy on 10/01/24.
//

import SwiftUI

struct CardView: View {
//    MARK: Properties
    
    @State private var randomNumber: Int = 1
    @State private var imageNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
//    MARK: Functions
    func randomImage()  {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
//            MARK: Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [.customGrayLight,
                                                                     .customGrayMedium],
                                                            startPoint: .top,
                                                        endPoint: .bottom))
                        Spacer()
                        
                        Button {
//                            Action show sheet
                            print("Button pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    Text("Fun and enjoyable outdoor activity for family and friends")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
//            MARK: Main content
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                
//                MARK: Footer
                
                Button(action: {
//                    action: generate random number
                    print("Explore more pressed")
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight,
                                                                 .customGreenMedium],
                                                        startPoint: .top,
                                                        endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                })
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
