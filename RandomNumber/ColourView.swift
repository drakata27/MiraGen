//
//  ColourView.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 14/10/2022.
//

import SwiftUI

struct PinkButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 226/255, green: 67/255, blue: 99/255))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ColourView: View {
    @State private var red = 0.0
    @State private var green = 0.0
    @State private var blue = 0.0
    @State private var feedback = UINotificationFeedbackGenerator()
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationView {
            List {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color(red: red/255, green: green/255, blue: blue/255))
                            .frame(width: 200, height: 200)
                        
                        Circle()
                            .strokeBorder(Color(red: 226/255, green: 67/255, blue: 99/255), lineWidth: 5)
                            .frame(width: 200, height: 200)
                    }
                    
                    HStack {
                        TextField("Red", value: $red, formatter: NumberFormatter())
                            .padding()
                            .foregroundColor(.red)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .focused($isFocused)
                            .keyboardType(.decimalPad)
                        
                        TextField("Green", value: $green, formatter: NumberFormatter())
                            .padding()
                            .foregroundColor(.green)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .focused($isFocused)
                            .keyboardType(.decimalPad)
                        
                        TextField("Blue", value: $blue, formatter: NumberFormatter())
                            .padding()
                            .foregroundColor(.blue)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .focused($isFocused)
                            .keyboardType(.decimalPad)
                    }
                    
                    Button {
                        randomiseColour()
                        feedback.notificationOccurred(.success)
                    } label: {
                        Text("Randomise Colour")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .buttonStyle(PinkButton())
                }
            }
            .navigationTitle("RandomColour")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button {
                        isFocused = false
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                            .foregroundColor(.pink)
                    }
                }
            }
        }
    }
    
    func randomiseColour() {
        red = Double.random(in: 0...255)
        green = Double.random(in: 0...255)
        blue = Double.random(in: 0...255)
    }
}

struct ColourView_Previews: PreviewProvider {
    static var previews: some View {
        ColourView()
    }
}
