//
//  NavigationBar.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 5.04.2021.
//

import SwiftUI

struct NavigationBar: View {
    
    let title: String
    let subtitle: String
    let isRoot: Bool
    
    var body: some View {
        HStack {
            if !isRoot { Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "chevron.backward").foregroundColor(.black)
                    .font(.system(size: .smallIconSize)).padding(.eightPoint)
            })
            }
            VStack(alignment: .leading) {
                if !title.isEmpty { Text(title).font(.title) }
                if !subtitle.isEmpty { Text(subtitle)
                    .font(.callout) }
                
            }.padding(.eightPoint)
            Spacer()
        }
        .frame(height: .smallNavigationBarHeight)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Collections", subtitle: "All Collection List", isRoot: true).previewLayout(.sizeThatFits).previewDisplayName("Title with subtitle, ROOT")
        NavigationBar(title: "Collections", subtitle: "", isRoot: true).previewLayout(.fixed(width: 375, height: .smallNavigationBarHeight)).previewDisplayName("Title, ROOT")
        NavigationBar(title: "Collections", subtitle: "", isRoot: false).previewLayout(.fixed(width: 375, height: .smallNavigationBarHeight)).previewDisplayName("Title with substitle, not ROOT")
        NavigationBar(title: "Collections", subtitle: "All Collection List", isRoot: false).previewLayout(.fixed(width: 375, height: .smallNavigationBarHeight)).previewDisplayName("Title, not ROOT")
    }
}
