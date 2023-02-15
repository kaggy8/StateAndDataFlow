//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 15.02.2023.
//

import Foundation
import Combine

final class DataManager: ObservableObject {
    static let shared = DataManager()
    private let user = UserManager.shared
    
    func loadData() {
        user.isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
        user.name = UserDefaults.standard.string(forKey: "username") ?? ""
    }
    
    private init() {}
}
