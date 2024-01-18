//
//  SettingsView.swift
//  Hike
//
//  Created by Sravanthi Chinthireddy on 11/01/24.
//

import SwiftUI

struct SettingsView: View {//    MARK: properties
    private let alternateAppIcons: [String] = ["AppIcon-MagnifyingGlass",
                                               "AppIcon-Map",
                                               "AppIcon-Mushroom",
                                               "AppIcon-Camera",
                                               "AppIcon-Backpack",
                                               "AppIcon-Campfire"]
    var body: some View {
        List {
//            MARK: - Section Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .heavy))
                    VStack {
                        Text("Hike")
                            .font(.system(size: 66, weight: .heavy))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .heavy))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(
                    colors: [.customGreenLight,
                             .customGreenMedium,
                             .customGreenDark],
                    startPoint: .top,
                    endPoint: .bottom))
                .padding(.top, 10)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                    .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFine the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .listRowSeparator(.hidden)
//            MARK: - Section icons
            Section(content: {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button(action: {
                                print("\(alternateAppIcons[item]) : tapped")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("failed to update the Appicon: \(String(describing: error?.localizedDescription))")
                                    }
                                    else {
                                        print("App icon updated to \(alternateAppIcons[item]) successfully")
                                    }
                                }
                            }, label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            })
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }, header: {
                Text("Alternate App Icons")
            })
            .listRowSeparator(.hidden)

            
//            MARK: - Section about
            Section(
                content: {
//                    Basic Labeled content
//                    LabeledContent("Application", value: "Hike")
                    
//                    Advanced Labeled content
                    CustomListRowView(rowLabel: "Application",
                                      rowIcon: "apps.iphone",
                                      rowContent: "Hike",
                                      rowTintColor: .blue)
                    
                    CustomListRowView(rowLabel: "Compatibility",
                                      rowIcon: "info.circle",
                                      rowContent: "iOS, iPadOS",
                                      rowTintColor: .red)
                    
                    CustomListRowView(rowLabel: "Technology",
                                      rowIcon: "swift",
                                      rowContent: "Swift",
                                      rowTintColor: .orange)
                    
                    CustomListRowView(rowLabel: "Version",
                                      rowIcon: "gear",
                                      rowContent: "1.0.0",
                                      rowTintColor: .purple)
                    
                    CustomListRowView(rowLabel: "Developer",
                                      rowIcon: "ellipsis.curlybraces",
                                      rowContent: "Abhyuday Reddy",
                                      rowTintColor: .blue)
                    
                    CustomListRowView(rowLabel: "Designer",
                                      rowIcon: "paintpalette",
                                      rowContent: "Medhaswi Nandikonda",
                                      rowTintColor: .pink)
                    
                    CustomListRowView(rowLabel: "Website",
                                      rowIcon: "globe",
                                      rowContent: nil,
                                      rowTintColor: .indigo,
                                      rowLinkLabel: "Go To Nandikonda",
                                      rowLinkDestination: "https://www.google.com")

                },
                header: {
                    Text("About The App")
                }, 
                footer: {
                    HStack {
                        Spacer()
                        Text("Copyrigth © All rights reserved.")
                        Spacer()
                    }
                    .padding(.vertical)
                }
                )
            
        }
    }
}

#Preview {
    SettingsView()
}
