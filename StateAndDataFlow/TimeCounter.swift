//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Stanislav Demyanov on 14.02.2023.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 5
    var timer: Timer?
    var buttonTitle = "СТАРТ"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(updateCounter),
                                         userInfo: nil,
                                         repeats: true)
        }
        
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "СБРОС"
            
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "СБРОС" {
            counter = 5
            buttonTitle = "СТАРТ"
        } else {
            buttonTitle = "ПОДОЖДИТЕ"
        }
        objectWillChange.send(self)
    }
}
