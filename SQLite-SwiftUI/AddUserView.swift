//
//  AddUserView.swift
//  SQLite-SwiftUI
//
//  Created by Mauldy Putra on 30/11/21.
//

import SwiftUI

struct AddUserView: View {
    // create variables to store user input values
    @State var name: String = ""
    @State var email: String = ""
    @State var age: String = ""
    //to go back on home screen when user is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            // create name field
            TextField("Enter name", text: $name)
                .padding(10)
                .foregroundColor(.gray)
                .border(.black, width: 1)
                .cornerRadius(5)
                .disableAutocorrection(true)
            
            // create email field
            TextField("Enter email", text: $email)
                .padding(10)
                .foregroundColor(.gray)
                .border(.black, width: 1)
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            // create age field
            TextField("Enter age", text: $age)
                .padding(10)
                .foregroundColor(.gray)
                .border(.black, width: 1)
                .cornerRadius(5)
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
            
            // button to add user
            Button {
                // call function to add row in sqlite database
                DB_Manager().addUser(nameValue: self.name, emailValue: self.email, ageValue: Int64(self.age) ?? 0)
                // go back to home page
                self.mode.wrappedValue.dismiss()
            } label: {
                Text("Add User")
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 10)
            .padding(.bottom, 10)
        }.padding()
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
