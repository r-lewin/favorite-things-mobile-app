//
//  ContentView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Item_list.title, ascending: true)]) var item_lists: FetchedResults<Item_list>
    @Environment(\.editMode) var mode
    var body: some View {
        NavigationView {
            MasterView(item_list: item_lists.first ?? Item_list(context: context))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                let item = Item(context: self.context)
                                item.name = "Item \((self.item_lists.first?.entries.count ?? 0) + 1)"
                                item.stored_in = self.item_lists.first
                                try? self.context.save()
                            }
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
