//
//  EmitSignalView.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import SwiftUI

struct EmitSignalView: View {
    @State var isNavigationBarHidden: Bool = true
    @State var emit: Bool = false
    var signal: SignalModel
    var signalEmitter = MorseSignalEmitter()

    var body: some View {
        Rectangle().foregroundColor(emit ? .white : .black).onTapGesture {
                isNavigationBarHidden.toggle()
        }.ignoresSafeArea().navigationBarHidden(isNavigationBarHidden).onAppear {
            signalEmitter.emitSignal(signal: signal) { emit in
                self.emit = emit
            }
        }
        
    }
}

struct EmitSignalView_Previews: PreviewProvider {
    static var previews: some View {
        EmitSignalView(signal: availableSignals[0])
    }
}
