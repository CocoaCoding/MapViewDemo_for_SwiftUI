//
//  ContentView.swift
//  MapKitDemo_SwiftUI
//
//  Created by Holger Hinzberg on 15.12.19.
//  Copyright © 2019 Holger Hinzberg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
