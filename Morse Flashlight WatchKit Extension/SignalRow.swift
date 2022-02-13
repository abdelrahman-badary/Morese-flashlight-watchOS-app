//
//  SignalRow.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import SwiftUI

struct SignalRow: View {
    var signal: SignalModel
    var body: some View {
        HStack {
            Text(signal.text).fontWeight(.bold)
            Spacer()
        }
    }
}

struct SignalRow_Previews: PreviewProvider {
    static var previews: some View {
        SignalRow(signal: availableSignals[0])
    }
}
