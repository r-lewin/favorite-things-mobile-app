//
//  LocationView.swift
//  FavoriteThings
//
//  Created by Ryan Lewin on 4/5/20.
//  Copyright © 2020 Ryan Lewin. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var item: Item
    var body: some View {
        VStack(alignment: .center) {
            ScrollView {
                HStack(alignment: .center) {
                    Text("Location:")
                        .font(Font.system(.headline).bold())
                    TextField("Enter Place name", text: $item.placeString)
                        .font(Font.system(.headline).bold())
                }
                HStack(alignment: .center) {
                    Text("Longitude:")
                        .font(Font.system(.headline).bold())
                    TextField("Enter longitude", text: $item.longitude)
                }
                HStack(alignment: .center) {
                    Text("Latitude:")
                        .font(Font.system(.headline).bold())
                    TextField("Enter longitude", text: $item.longitude)
                }
            }.padding()
            Spacer()
        }
    }
}
