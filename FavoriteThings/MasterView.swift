//
//  MasterView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 26/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var item_list: Item_list
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack{
            if mode?.wrappedValue == .active {
                TextField("Enter title", text: Binding($item_list.title)!)
                    .font(Font.system(.largeTitle).bold())
                    .padding(.leading)
                    .onDisappear(perform: { try? self.context.save() })
            }
            List{
                ForEach(item_list.entries, id: \.self) { item in
                    ItemRowView(item: item)
                }.onDelete { indices in
                    indices.forEach { self.item_list.removeFromStores(at: $0) }
                }.onMove{ (indices, destination) in
                    indices.forEach { self.item_list.move(moving: self.item_list.entries[$0], to: destination)}
                }
            }
        }
        .navigationBarTitle(mode?.wrappedValue == .active ? "": item_list.title!)
        .onAppear(perform: { try? self.context.save() })
    }
}
