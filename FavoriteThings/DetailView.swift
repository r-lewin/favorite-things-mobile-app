//
//  DetailView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 26/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var item: Item
    var body: some View {
        VStack(alignment: .center) {
            item.getImg()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            ScrollView {
                TextField("Enter name", text: $item.nameString)
                    .font(.largeTitle)
                    .padding(.bottom)
                HStack(alignment: .center) {
                    TextField("Enter tag", text: $item.tag1String)
                        .font(Font.system(.headline).bold())
                    TextField("Enter info", text: $item.info1String)
                }
                HStack(alignment: .center) {
                    TextField("Enter tag", text: $item.tag2String)
                        .font(Font.system(.headline).bold())
                    TextField("Enter info", text: $item.info2String)
                }
                HStack(alignment: .center) {
                    TextField("Enter tag", text: $item.tag3String)
                        .font(Font.system(.headline).bold())
                    TextField("Enter info", text: $item.info3String)
                        .padding(.bottom)
                }
                VStack(alignment:.center){
                    Text("Item Note")
                        .font(.title)
                    TextField("Enter text", text: $item.noteString)
                        .border(Color.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                }
                VStack(alignment: .center) {
                    Text("Icon Url")
                        .font(.title)
                    TextField("Enter Url", text: $item.urlString)
                    .border(Color.gray)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                }
            }
        }.modifier(KeyboardOffset())
            .animation(.spring())
    }
}


