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
    
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    var futureDate: Date?
    
    init(futureDate: Date) {
        self.futureDate = futureDate
    }
    
    func updateTimeRamaining() {
        let remaining = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate ?? Date())
        days = "\(remaining.day ?? 0)"
        hours = "\(remaining.hour ?? 0)"
        minutes = "\(remaining.minute ?? 0)"
        seconds = "\(remaining.second ?? 0)"
    }
}
