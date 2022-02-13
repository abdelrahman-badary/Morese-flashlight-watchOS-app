//
//  SignalsListView.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import SwiftUI

struct SignalsListView: View {
    var signals: [SignalModel]
    @State var customSignal = ""
    var body: some View {
        List {
            TextField("Custom signal", text: $customSignal)
            ForEach(signals) { signal in
                NavigationLink {
                    EmitSignalView(signal: signal)
                } label: {
                    SignalRow(signal: signal)

                }

            }
        }.navigationTitle("Signals List")

    }
}

struct SignalsListView_Previews: PreviewProvider {
    static var previews: some View {
        SignalsListView(signals: availableSignals)
    }
}
