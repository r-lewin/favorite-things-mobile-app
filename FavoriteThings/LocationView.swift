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
            MapView(item: item)
            ScrollView {
                HStack(alignment: .center) {
                    Text("Location:")
                        .font(Font.system(.headline).bold())
                    TextField("Enter Place name", text: $item.placeString, onCommit: {
                        self.item.updateCoordsFromName()
                    }).font(Font.system(.headline).bold())
                }
                HStack(alignment: .center) {
                    Text("Latitude:")
                        .font(Font.system(.headline).bold())
                    TextField("Enter latitude", text: $item.latitudeString)
                }
                HStack(alignment: .center) {
                    Text("Latitude:")
                        .font(Font.system(.headline).bold())
                    TextField("Enter longitude", text: $item.longitudeString)
                }
                Button("Update Location Name"){
                    self.item.updateNameFromCoords()
                }
                Spacer()
            }
        }
    }
}
