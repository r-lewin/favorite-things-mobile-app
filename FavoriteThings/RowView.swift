//
//  RowView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 26/4/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item
    var body: some View {
        NavigationLink(destination: DetailView(item: item.self, local: item.local)){
            HStack() {
                item.getImg()
                    .resizable()
                    .frame(width: 84.0, height: 64.0)
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
