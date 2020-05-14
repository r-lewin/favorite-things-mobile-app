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
    @ObservedObject var local: Location
    
    var body: some View {
        VStack(alignment: .center) {
            MapView(item: item, local: local)
            HStack(alignment: .center) {
                Text("Location:")
                    .font(Font.system(.headline).bold())
                TextField("Enter Place name", text: $local.nameString, onCommit: {
                    self.item.local.updateCoordsFromName()
                    try? self.context.save()
                }).font(Font.system(.headline).bold())
            }
            HStack(alignment: .center) {
                Text("Latitude:")
                    .font(Font.system(.headline).bold())
                TextField("Enter latitude", text: $local.latitudeString)
            }
            HStack(alignment: .center) {
                Text("Latitude:")
                    .font(Font.system(.headline).bold())
                TextField("Enter longitude", text: $local.longitudeString)
            }
            Button("Update Location Name"){
                self.local.updateNameFromCoords()
                try? self.context.save()
            }
        }
        .padding(.bottom)
        .modifier(KeyboardOffset())
        .animation(.spring())
        .onDisappear(perform: { try? self.context.save() })
    }
}
