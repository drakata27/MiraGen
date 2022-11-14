//
//  RandomNameView.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 14/10/2022.
//

import SwiftUI

struct RandomNameView: View {
    @State private var selectedGenderName = "Boy"
    @State private var selectedGenderNameHistory = "Boy"
    @State private var genders = ["Boy", "Girl"]
    @State private var gendersHistory = ["Boy", "Girl"]
    
    private var names : [Names] = Names.allNames
    @State private var randomNameNumber = 0
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @State private var girlHistory = [String]()
    @State private var boyHistory = [String]()
    
    var body: some View {
        NavigationView{
            List {
                Section("Random Name") {
                    Picker("Select number of children", selection: $selectedGenderName) {
                        ForEach(genders, id: \.self) { name in
                            Text(name)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedGenderName == genders[0] {
                        Text("Random boy name is \(names[0].boys[randomNameNumber])")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Button {
                            randomNameNumber = Int.random(in: 0...998)
                            boyHistory.append(names[0].boys[randomNameNumber])
                            feedback.notificationOccurred(.success)
                        } label: {
                            Text("Tap")
                                .foregroundColor(.pink)
                        }
                    } else {
                        Text("Random girl name is \(names[0].girls[randomNameNumber])")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Button {
                            randomNameNumber = Int.random(in: 0...999)
                            girlHistory.append(names[0].girls[randomNameNumber])
                            feedback.notificationOccurred(.success)
                        } label: {
                            Text("Tap")
                                .foregroundColor(.pink)
                        }
                    }
                }
                
                // TODO change colour of the tab items
                Section("History") {
                    Picker("Select number of children", selection: $selectedGenderNameHistory) {
                        ForEach(gendersHistory, id: \.self) { name in
                            Text(name)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedGenderNameHistory == genders[0] {
                        ForEach(boyHistory, id: \.self) { boy in
                            Text(boy)
                        }
                        .onDelete(perform: removeRowsBoy)
                    } else {
                        ForEach(girlHistory, id: \.self) { girl in
                            Text(girl)
                        }
                        .onDelete(perform: removeRowsGirl)
                    }
                }
            }
            .navigationTitle("RandomGender")
        }
    }
    
    func removeRowsBoy(at offsets: IndexSet) {
        boyHistory.remove(atOffsets: offsets)
    }
    
    func removeRowsGirl(at offsets: IndexSet) {
        girlHistory.remove(atOffsets: offsets)
    }
}

struct RandomNameView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNameView()
    }
}
