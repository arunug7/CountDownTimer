//
//  CountDownTimerViewModel.swift
//  CountDownTimer
//
//  Created by Arun on 27/03/24.
//

import Foundation

class CountDownTimerViewModel: ObservableObject {
    @Published var days = ""
    @Published var hours = ""
    @Published var minutes = ""
    @Published var seconds = ""
    @Published var showWelcomeScreen = false
    //Timer which publishes for each second
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    var futureDate: Date?
    
    init(futureDate: Date) {
        self.futureDate = futureDate
    }
    //Calculating remaining time and updating the published properties
    func updateTimeRamaining() {
        guard let futureDate = futureDate else {
            return
        }
        let remainingTime = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
        if remainingTime.day == 0 && remainingTime.hour == 0 && remainingTime.minute == 0 && remainingTime.second == 0 {
            showWelcomeScreen.toggle()
        }
        days = "\(remainingTime.day ?? 0)"
        hours = "\(remainingTime.hour ?? 0)"
        minutes = "\(remainingTime.minute ?? 0)"
        seconds = "\(remainingTime.second ?? 0)"
    }
}
