//
//  ContentView.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignalsListView(signals: availableSignals)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
