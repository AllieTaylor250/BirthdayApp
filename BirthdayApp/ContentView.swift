//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var newName = ""
    @State private var newBirthday =  Date.now
    @State private var friends: [Friend] = [Friend(name: "Allie", birthday: .now),Friend(name:"Ana", birthday: Date(timeIntervalSince1970: 0))]
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) {friend
                in
                HStack {
                    Text(friend.name)
                    Spacer ()
                    Text(friend.birthday, format: .dateTime.month(.wide) .day().year())
                }//end HStack
            }//end List
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday,
                        in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }//end Date Picker
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }//end Button
                    .bold()
                }//end VStack
                .padding()
                .background(.bar)
                
            }//end safeareainset
        }//end NavStack
    }//end body
}//end struct

#Preview {
    ContentView()
}
