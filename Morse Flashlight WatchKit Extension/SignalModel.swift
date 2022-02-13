//
//  SignalModel.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import Foundation
struct SignalModel: Identifiable {
    var id: Int {
        text.hash
    }
    var text: String
}

var availableSignals: [SignalModel] = [SignalModel(text: "SOS"), SignalModel(text: "Hello my name is Zeta"), SignalModel(text: "1"), SignalModel(text: "2")]
