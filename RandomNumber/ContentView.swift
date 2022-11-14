//
//  ContentView.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 12/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var randomNumber = 0
    @State private var minimum = "Minimum"
    @State private var maximum = "Maximum"
    
    @FocusState private var isFocused: Bool
    
    @State private var selectedNumber = 1
    @State private var genders = ["Boy", "Girl"]
    @State private var genderIsRandomised = false
    
    @State private var randomGender1 = ""
    @State private var randomGender2 = ""
    @State private var randomGender3 = ""
    
    @State private var feedback = UINotificationFeedbackGenerator()
        
    var body: some View {
        NavigationView {
            List{
                Section("Random number") {
                    HStack {
                        Text(minimum)
                        Spacer()
                        TextField(minimum, value: $num1, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                    }
                    HStack {
                        Text(maximum)
                        Spacer()
                        TextField(maximum, value: $num2, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                    }
                    
                    Text("Your random number is \(randomNumber)")
                        .font(.headline)
                
                    Button {
                        randomNumberGenerator()
                        feedback.notificationOccurred(.success)
                    } label: {
                        Text("Generate Number")
                            .foregroundColor(.pink)
                    }
                }
                
                Section("Random gender") {
                    Picker("Select number of children", selection: $selectedNumber) {
                        ForEach(1..<4, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    HStack {
                        Text( selectedNumber == 1 ? "The gender is " : "The genders are" )
                        Text(randomGender1)
                            .foregroundColor( randomGender1 == "Boy" ? .blue : .pink)
                        
                        Text(randomGender2)
                            .foregroundColor(randomGender2 == "Boy" ? .blue : .pink)
                        
                        Text(randomGender3)
                            .foregroundColor(randomGender3 == "Boy" ? .blue : .pink)
                        
                    }
                    .font(.headline)
                    
                    Button {
                        randomGenders()
                        feedback.notificationOccurred(.success)
                    } label: {
                        Text("Generate Gender")
                            .foregroundColor(.pink)
                    }
                }
            }
            .navigationTitle("MiraGen")
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
    
    func randomNumberGenerator() {
        if num1 < num2 {
            randomNumber = Int.random(in: num1...num2)
            minimum = "Minimum"
            maximum = "Maximum"
        } else if num1 > num2 {
            randomNumber = Int.random(in: num2...num1)
            minimum = "Maximum"
            maximum = "Minimum"
        } else {
            randomNumber = num1
            minimum = "Minimum"
            maximum = "Maximum"
        }
    }
    
    func randomGenders() {
        if selectedNumber == 1 {
            randomGender1 = genders[Int.random(in: 0...1)]
            randomGender2 = ""
            randomGender3 = ""
            genderIsRandomised = true
        } else if selectedNumber == 2 {
            randomGender1 = genders[Int.random(in: 0...1)]
            randomGender2 = genders[Int.random(in: 0...1)]
            randomGender3 = ""
            genderIsRandomised = true
        } else {
            randomGender1 = genders[Int.random(in: 0...1)]
            randomGender2 = genders[Int.random(in: 0...1)]
            randomGender3 = genders[Int.random(in: 0...1)]
            genderIsRandomised = true
        }
    }
    
    func getRandomColor() -> UIColor {
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
