//
//  ContentView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 18/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel =  FruitDirectory()
    var body: some View {
        NavigationView {
            MasterView(viewModel: viewModel)
            .navigationBarTitle("Fruits")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(
                    action: {
                        withAnimation { self.viewModel.fruits.append(Fruit()) }
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
    @ObservedObject var viewModel: FruitDirectory
    var body: some View {
        List {
            // Loops through array off spiders stored in Fruit Dir
            ForEach(viewModel.fruits) { fruit in
                FruitRowView(fruit: fruit)
            }.onDelete { indices in
                indices.forEach { self.viewModel.fruits.remove(at: $0) }
            }.onMove{ (indices, destination) in
                self.viewModel.fruits.move(fromOffsets: indices, toOffset: destination)
            }
        }
    }
}

struct FruitRowView: View {
    @ObservedObject var fruit: Fruit
    var body: some View {
        NavigationLink(destination: DetailView(fruit: fruit.self )){
            HStack() {
                fruit.getImg(url: fruit.picURL)
                    .resizable()
                    .frame(width: 64.0, height: 64.0)
                Text(fruit.name)
                    .fontWeight(.light)
                Spacer()
                Text(fruit.family)
                    .fontWeight(.bold)
            }
        }
    }
}

struct DetailView: View {
   @ObservedObject var fruit: Fruit
    var body: some View {
        VStack(alignment: .center) {
            Text("Notes")
                .font(.title)
            TextField("Enter text", text: $fruit.note)
                .border(Color.gray)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            fruit.getImg(url: fruit.picURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom)
            VStack() {
                TextField("Enter name", text: $fruit.name)
                    .font(.title)
                HStack(alignment: .center) {
                    Text("Genus:")
                        .fontWeight(.bold)
                    TextField("Enter genus", text: $fruit.genus)
                }
                HStack(alignment: .center) {
                    Text("Family")
                        .fontWeight(.bold)
                    TextField("Enter family", text: $fruit.family)
                }
                HStack() {
                    Text("Image URL")
                        .fontWeight(.bold)
                    TextField("Enter Url", text: $fruit.picURL)
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
