//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 14.02.2023.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManger = UserManager.shared
    private let isRegistered: () = DataManager.shared.loadData()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManger)
        }
    }
}
