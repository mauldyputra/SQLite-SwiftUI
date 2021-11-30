//
//  ContentView.swift
//  SQLite-SwiftUI
//
//  Created by Mauldy Putra on 29/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var userModels: [UserModel] = []
    
    // check if user is selected for edit
    @State var userSelected: Bool = false
    
    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0
    
    var body: some View {
        // create navigation view
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: AddUserView()) {
                        Text("Add User")
                    }
                }
                
                //navigating link to go to edit user view
                NavigationLink(destination: EditUserView(id: self.$selectedUserId), isActive: self.$userSelected) {
                    EmptyView()
                }
                
                // create list view to show all users
                List(self.userModels) { (model) in
                    // show name, email and age horizontally
                    HStack {
                        Text(model.name)
                        Spacer()
                        Text(model.email)
                        Spacer()
                        Text("\(model.age)")
                        
                        // button to edit user
                        Button {
                            self.selectedUserId = model.id
                            self.userSelected = true
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                            
                            // by default, button are full width. to prevent this, use the following
                                .buttonStyle(PlainButtonStyle())
                        }
                        
                        // button to delete user
                        Button {
                            // create db manager instance
                            let dbManager: DB_Manager = DB_Manager()
                            
                            // call delete function
                            dbManager.deleteUser(idValue: model.id)
                            
                            // refresh the user models array
                            self.userModels = dbManager.getUsers()
                            
                        } label: {
                            Text("Delete")
                                .foregroundColor(.red)
                        }
                        // by default, buttons are full width. to prevent this, use the following
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }.padding()
            
            // load data in user models array
            .onAppear {
                self.userModels = DB_Manager().getUsers()
            }
            .navigationTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
