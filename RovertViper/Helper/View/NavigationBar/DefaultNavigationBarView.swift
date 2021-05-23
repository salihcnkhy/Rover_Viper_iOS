//
//  NavigationBar.swift
//  RovertViper
//
//  Created by Salihcan Kahya on 5.04.2021.
//

import SwiftUI

public struct DefaultNavigationBarView: NavigationBarViewProtocol {
    @Environment(\.presentationMode) var presentation
    let title: String
    let subtitle: String
    let isRoot: Bool
    
    
    public init(model: NavigationBarModel) {
        title = model.title
        subtitle = model.subtitle
        isRoot = model.isRoot
    }
    
    public var body: some View {
        HStack {
            if !isRoot { Button(action: { presentation.wrappedValue.dismiss() }, label: {
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
        DefaultNavigationBarView(model: .init(title: "Collections", subtitle: "All Collection List", isRoot: true)).previewLayout(.sizeThatFits).previewDisplayName("Title with subtitle, ROOT")
        DefaultNavigationBarView(model: .init(title: "Collections", subtitle: "", isRoot: true)).previewLayout(.fixed(width: 375, height: .smallNavigationBarHeight)).previewDisplayName("Title, ROOT")
        DefaultNavigationBarView(model: .init(title: "Collections", subtitle: "", isRoot: false)).previewLayout(.fixed(width: 375, height: .smallNavigationBarHeight)).previewDisplayName("Title with substitle, not ROOT")
        DefaultNavigationBarView(model: .init(title: "Collections", subtitle: "All Collection List", isRoot: false)).previewLayout(.fixed(width: 375, height: .smallNavigationBarHeight)).previewDisplayName("Title, not ROOT")
    }
}
