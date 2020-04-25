//
//  ContentView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @ObservedObject var viewModel =  FruitDirectory()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors:  [NSSortDescriptor(keyPath: \Item_list.title, ascending: true)]) var item_lists: FetchedResults<Item_list>
    @Environment(\.editMode) var mode
    var body: some View {
        NavigationView {
            MasterView(item_list: item_lists.first ?? Item_list(context: context))
                .navigationBarTitle(item_lists.first?.title ?? "Item List")
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

struct MasterView: View {
//    @ObservedObject var viewModel: FruitDirectory
    @Environment(\.managedObjectContext) var context
    @ObservedObject var item_list: Item_list
    @Environment(\.editMode) var mode
    var body: some View {
        VStack{
            if mode?.wrappedValue == .active {
                TextField("Enter title", text: Binding($item_list.title)!)
                    .font(Font.system(.largeTitle).bold())
                    .padding(.leading)
            }
            List{
                ForEach(item_list.entries, id: \.self) { item in
                    ItemRowView(item: item)
                }.onDelete { indices in
                    indices.forEach { self.item_list.removeFromStores(at: $0) }
//                }.onMove{ (indices, destination) in
//                    self.item_list.entries.move(fromOffsets: indices, toOffset: destination)
                }
            }
        }
        .navigationBarTitle(mode?.wrappedValue == .active ? "": item_list.title!)
        .onAppear(perform: { try? self.context.save() })
    }
}

struct ItemRowView: View {
    @ObservedObject var item: Item
    var body: some View {
        NavigationLink(destination: DetailView(item: item.self )){
            HStack() {
//                item.getImg(url: fruit.picURL)
//                    .resizable()
//                    .frame(width: 64.0, height: 64.0)
                Spacer()
                Text(item.name!)
                    .fontWeight(.bold)
                Spacer()
                Text(item.info1!)
                    .fontWeight(.light)
                    .italic()
                Spacer()
            }
        }
    }
}

struct DetailView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var item: Item
    var body: some View {
        VStack(alignment: .center) {
            Text("Notes")
                .font(.title)
            TextField("Enter text", text: Binding($item.note)!)
                .border(Color.gray)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            VStack() {
                TextField("Enter name", text: Binding($item.name)!)
                    .font(.title)
                HStack(alignment: .center) {
                    TextField("Enter tag", text: Binding($item.tag1)!)
                        .font(Font.system(.headline).bold())
                    TextField("Enter info", text: Binding($item.info1)!)
                }
                HStack(alignment: .center) {
                    TextField("Enter tag", text: Binding($item.tag2)!)
                        .font(Font.system(.headline).bold())
                    TextField("Enter info", text: Binding($item.info2)!)
                }
                HStack(alignment: .center) {
                    TextField("Enter tag", text: Binding($item.tag3)!)
                        .font(Font.system(.headline).bold())
                    TextField("Enter info", text: Binding($item.info3)!)
                }
                HStack() {
                    Text("Pic URL")
                        .font(Font.system(.headline).bold())
                    TextField("Enter Url", text: Binding($item.image_url)!)
                }
            }.padding()
            Spacer()
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(fruitDir: FruitDirectory())
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
