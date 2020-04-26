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
                .padding(.bottom)
            VStack() {
                TextField("Enter name", text: Binding($item.name)!)
                    .font(.largeTitle)
                    .padding(.bottom)
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
                        .padding(.bottom)
                }
                VStack(alignment:.center){
                    Text("Item Note")
                        .font(.title)
                    TextField("Enter text", text: Binding($item.note)!)
                        .border(Color.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                }
                VStack(alignment: .center) {
                    Text("Icon Url")
                        .font(.title)
                    TextField("Enter Url", text: Binding($item.image_url)!)
                    .border(Color.gray)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                }
            }.padding()
            Spacer()
        }
    }
}
