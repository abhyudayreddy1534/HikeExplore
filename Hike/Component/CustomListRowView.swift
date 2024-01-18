//
//  CustomListRowView.swift
//  Hike
//
//  Created by Sravanthi Chinthireddy on 11/01/24.
//

import SwiftUI

struct CustomListRowView: View {
//    MARK: Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                .fontWeight(.semibold)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(destination: URL(string: rowLinkDestination!)!, label: {
                    Text(rowLinkLabel!)
                        .foregroundStyle(.pink)
                    .fontWeight(.semibold)
                })
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color(rowTintColor))
                    Image(systemName: rowIcon)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List() {
        CustomListRowView(rowLabel: "Designer",
                          rowIcon: "paintpalette",
                          rowContent: nil,
                          rowTintColor: .pink,
                          rowLinkLabel: "Go To Abhyuday",
                          rowLinkDestination: "www.nandikonda.com")
    }
}
