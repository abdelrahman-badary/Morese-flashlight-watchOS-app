//
//  MorseSignalEmitter.swift
//  Morse Flashlight WatchKit Extension
//
//  Created by Abdelrahman Badary on 11/02/2022.
//

import Foundation
import WatchKit
class MorseSignalEmitter {
    fileprivate var ditDahGenerator: DitDahGenerator?

    
    func emitSignal(signal: SignalModel ,executionBlock: @escaping (Bool) -> ()) {
        let ditDahGenerator = DitDahGenerator(text: signal.text)
        self.ditDahGenerator = ditDahGenerator
        let signals = ditDahGenerator.getFullSignal()
        var loop: ((Int) -> Void)!
        var index = 0
        loop = { [weak self] count in
          guard count > 0 else {
              return }
            let signal = signals[index]
            executionBlock(signal.isOn)
            index += 1
        
            DispatchQueue.main.asyncAfter(deadline: .now() + signal.time) {
                if index == signals.count - 1 {
                    WKInterfaceDevice.current().play(.success)
                }
            loop(count - 1)
          }
        }
        loop(signals.count)
    }

}
struct SingleEmit {
    var isOn: Bool
    var time: Double
}
class DitDahGenerator {
    var ditInterval: Double = 0.132
    var dahInterval: Double = 0.396
    var text: String
    init(text: String) {
        self.text = text
    }
    
    func getFullSignal() -> [SingleEmit] {
        var fullSignal = [SingleEmit]()
        let words = text.split(separator: " ")
        for word in words {
            let charArray = Array(word)
            for (index, char) in charArray.enumerated() {
                let charSignal = getCharacterSignal(character: String(char))
                fullSignal.append(contentsOf: charSignal)
                if index != charArray.count {
                    fullSignal.append(getInterCharactersssSpace())
                }
            }
            fullSignal.append(getInterWordsSpace())
        }
        return fullSignal
    }
    
    func getCharacterSignal(character: String) -> [SingleEmit] {
        var characterEmits: [SingleEmit]
        switch character.lowercased() {
        case "a":
            characterEmits = [dit(), dah()]
        case "b":
            characterEmits = [dah(), dit(), dit(), dit()]
        case "c":
            characterEmits = [dah(), dit(), dah(), dit()]
        case "d":
            characterEmits = [dah(), dit(), dit()]
        case "e":
            characterEmits = [dit()]
        case "f":
            characterEmits = [dit(), dit(), dah(), dit()]
        case "g":
            characterEmits = [dah(), dah(), dit()]
        case "h":
            characterEmits = [dit(), dit(), dit(), dit()]
        case "i":
            characterEmits = [dit(), dit()]
        case "j":
            characterEmits = [dit(), dah(), dah(), dah()]
        case "k":
            characterEmits = [dit(), dah(), dit()]
        case "l":
            characterEmits = [dit(), dah(), dit(), dit()]
        case "m":
            characterEmits = [dah(), dah()]
        case "n":
            characterEmits = [dah(), dit()]
        case "o":
            characterEmits = [dah(), dah(), dah()]
        case "p":
            characterEmits = [dit(), dah(), dah(), dit()]
        case "q":
            characterEmits = [dah(), dah(), dit(), dah()]
        case "r":
            characterEmits = [dit(), dah(), dit()]
        case "s":
            characterEmits = [dit(), dit(), dit()]
        case "t":
            characterEmits = [dah()]
        case "u":
            characterEmits = [dit(), dit(), dah()]
        case "v":
            characterEmits = [dit(), dit(), dit(), dah()]
        case "w":
            characterEmits = [dit(), dah(), dah()]
        case "x":
            characterEmits = [dah(), dit(), dit(), dah()]
        case "y":
            characterEmits = [dah(), dit(), dah(), dah()]
        case "z":
            characterEmits = [dah(), dah(), dit(), dit()]
        case "1":
            characterEmits = [dit(), dah(), dah(), dah(), dah()]
        case "2":
            characterEmits = [dit(), dit(), dah(), dah(), dah()]
        case "3":
            characterEmits = [dit(), dit(), dit(), dah(), dah()]
        case "4":
            characterEmits = [dit(), dit(), dit(), dit(), dah()]
        case "5":
            characterEmits = [dit(), dit(), dit(), dit(), dit()]
        case "6":
            characterEmits = [dah(), dit(), dit(), dit(), dit()]
        case "7":
            characterEmits = [dah(), dah(), dit(), dit(), dit()]
        case "8":
            characterEmits = [dah(), dah(), dah(), dit(), dit()]
        case "9":
            characterEmits = [dah(), dah(), dah(), dah(), dit()]
        case "0":
            characterEmits = [dah(), dah(), dah(), dah(), dah()]
        default:
            return []
        }
        if characterEmits.count != 1 {
            let newCharacterEmits = (0 ..< 2 * characterEmits.count - 1).map { $0 % 2 == 0 ? characterEmits[$0/2] : interCharacterSpace() }
            return newCharacterEmits
        } else {
            return characterEmits
        }

    }
    
    func dit() -> SingleEmit {
        return SingleEmit(isOn: true, time: ditInterval)
    }
    
    func dah() -> SingleEmit {
        return SingleEmit(isOn: true, time: dahInterval)
    }
    
    func interCharacterSpace() -> SingleEmit {
        return SingleEmit(isOn: false, time: ditInterval)
    }
    
    func getInterCharactersssSpace() -> SingleEmit {
        return SingleEmit(isOn: false, time: ditInterval * 3.0)
    }
    
    func getInterWordsSpace() -> SingleEmit {
        return SingleEmit(isOn: false, time: ditInterval * 7.0)
    }
}
