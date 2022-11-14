//
//  AddressView.swift
//  RandomNumber
//
//  Created by Aleksandar Drakaliyski on 30/10/2022.
//

import SwiftUI

struct AddressView: View {
    private var addresses: [Addresses] = Addresses.allAddresses
    @State private var feedback = UINotificationFeedbackGenerator()
    @State private var randomNumber = 0
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Address: ")
                    Text(addresses[0].addresses[randomNumber].address1)
                }
                
                HStack {
                    Text("City: ")
                    Text(addresses[0].addresses[randomNumber].city ?? "Unknown")
                }
                
                HStack {
                    Text("State: ")
                    Text(addresses[0].addresses[randomNumber].state.rawValue)
                }
                
                HStack {
                    Text("Postal Code: ")
                    Text(addresses[0].addresses[randomNumber].postalCode)
                }
                
                Button {
                    randomNumber = Int.random(in: 0...998)
                    feedback.notificationOccurred(.success)
                } label: {
                    Text("Random Address")
                        .foregroundColor(.white)
                }
                .padding()
                .buttonStyle(PinkButton())
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("RandomAddress")
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}

//ForEach(addresses[0].addresses, id: \.address1) { address in
//    Text(address.address1)
//    Text(address.city ?? "Blagoevgrad")
//}

//"address1": "632 North Pine Street",
//"address2": "",
//"city": "Anchorage",
//"state": "AK",
//"postalCode": "99508",
//"coordinates": {
//    "lat": 61.22930220000001,
//    "lng": -149.7938547
//}
