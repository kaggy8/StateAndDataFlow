//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 14.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 65)
            Spacer()
            ButtonStartWR(timer: timer)
            Spacer()
            ButtonLogout()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonStartWR: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button {
            timer.startTimer()
        } label: {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 250, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 5))
    }
}

struct ButtonLogout: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Button {
            if let bundleID = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundleID)
            }
            userManager.isRegistered = false
        } label: {
            Text("Выход")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 250, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 5))
    }
}


