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
        List{
            ForEach(item_list.entries, id: \.self) { item in
                Text("\(item.name ?? "Item name")")
            }
        }
//        VStack{
//            if mode?.wrappedValue == .active {
//                TextField("Enter title", text: $viewModel.title)
//                    .font(Font.system(.largeTitle).bold())
//                    .padding(.leading)
//            }
//            List {
//                // Loops through array off spiders stored in Fruit Dir
//                ForEach(viewModel.fruits) { fruit in
//                    FruitRowView(fruit: fruit)
//                }.onDelete { indices in
//                    indices.forEach { self.viewModel.fruits.remove(at: $0) }
//                }.onMove{ (indices, destination) in
//                    self.viewModel.fruits.move(fromOffsets: indices, toOffset: destination)
//                }
//            }
//        }
//        .navigationBarTitle(mode?.wrappedValue == .active ? "": viewModel.title)
    }
}

//struct FruitRowView: View {
//    @ObservedObject var fruit: Fruit
//    var body: some View {
//        NavigationLink(destination: DetailView(fruit: fruit.self )){
//            HStack() {
//                fruit.getImg(url: fruit.picURL)
//                    .resizable()
//                    .frame(width: 64.0, height: 64.0)
//                Spacer()
//                Text(fruit.name)
//                    .fontWeight(.bold)
//                Spacer()
//                Text(fruit.genus)
//                    .fontWeight(.light)
//                    .italic()
//                Spacer()
//            }
//        }
//    }
//}
//
//struct DetailView: View {
//   @ObservedObject var fruit: Fruit
//    var body: some View {
//        VStack(alignment: .center) {
//            Text("Notes")
//                .font(.title)
//            TextField("Enter text", text: $fruit.note)
//                .border(Color.gray)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            fruit.getImg(url: fruit.picURL)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding(.bottom)
//            VStack() {
//                TextField("Enter name", text: $fruit.name)
//                    .font(.title)
//                HStack(alignment: .center) {
//                    TextField("Enter tag", text: $fruit.genusTag)
//                        .font(Font.system(.headline).bold())
//                    TextField("Enter info", text: $fruit.genus)
//                }
//                HStack(alignment: .center) {
//                    TextField("Enter tag", text: $fruit.familyTag)
//                        .font(Font.system(.headline).bold())
//                    TextField("Enter info", text: $fruit.family)
//                }
//                HStack(alignment: .center) {
//                    TextField("Enter tag", text: $fruit.tasteTag)
//                        .font(Font.system(.headline).bold())
//                    TextField("Enter info", text: $fruit.taste)
//                }
//                HStack() {
//                    TextField("Enter tag", text: $fruit.picURLTag)
//                        .font(Font.system(.headline).bold())
//                    TextField("Enter Url", text: $fruit.picURL)
//                }
//            }.padding()
//            Spacer()
//        }
//    }
//}


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
