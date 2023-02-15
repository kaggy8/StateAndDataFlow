//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 14.02.2023.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var userManager: UserManager

    var body: some View {
        Group {
            if userManager.isRegistered {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
