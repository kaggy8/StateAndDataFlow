//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 14.02.2023.
//

import Combine

final class UserManager: ObservableObject {
    static let shared = UserManager()
    @Published var isRegistered = false
    var name = ""
}
