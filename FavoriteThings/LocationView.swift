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
            MapView(item: item, location: location)
            HStack(alignment: .center) {
                Text("Location:")
                    .font(Font.system(.headline).bold())
                TextField("Enter Place name", text: $location.nameString, onCommit: {
                    self.location.updateCoordsFromName()
                }).font(Font.system(.headline).bold())
            }
            HStack(alignment: .center) {
                Text("Latitude:")
                    .font(Font.system(.headline).bold())
                TextField("Enter latitude", text: $location.latitudeString)
            }
            HStack(alignment: .center) {
                Text("Latitude:")
                    .font(Font.system(.headline).bold())
                TextField("Enter longitude", text: $location.longitudeString)
            }
            Button("Update Location Name"){
                self.location.updateNameFromCoords()
            }
        }
        .padding(.bottom)
        .modifier(KeyboardOffset())
        .animation(.spring())
    }
}
