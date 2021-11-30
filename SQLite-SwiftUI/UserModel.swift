//
//  UserModel.swift
//  SQLite-SwiftUI
//
//  Created by Mauldy Putra on 29/11/21.
//

import Foundation

class UserModel: Identifiable {
    public var id: Int64 = 0
    public var name: String = ""
    public var email: String = ""
    public var age: Int64 = 0
}
