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
    @ObservedObject var location: Location
    var body: some View {
        VStack(alignment: .center) {
            MapView(location: location)
            HStack(alignment: .center) {
                Text("Location:")
                    .font(Font.system(.headline).bold())
                TextField("Enter Place name", text: $item.local.nameString, onCommit: {
                    self.item.local.updateCoordsFromName()
                }).font(Font.system(.headline).bold())
            }
            HStack(alignment: .center) {
                Text("Latitude:")
                    .font(Font.system(.headline).bold())
                TextField("Enter latitude", text: $item.local.latitudeString)
            }
            HStack(alignment: .center) {
                Text("Latitude:")
                    .font(Font.system(.headline).bold())
                TextField("Enter longitude", text: $item.local.longitudeString)
            }
            Button("Update Location Name"){
                self.item.local.updateNameFromCoords()
            }
        }
    }
}
