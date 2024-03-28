//
//  ContentView.swift
//  CountDownTimer
//
//  Created by Arun on 27/03/24.
//

import SwiftUI

struct CountDownTimerView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1216467097, green: 0.09713650495, blue: 0.161232084, alpha: 1))
            CountDownTimerContentLayer()
        }
        .ignoresSafeArea()
    }
}

struct CountDownTimerContentLayer: View {
    
    @StateObject var viewModel = CountDownTimerViewModel(futureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date())
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            Text("We are launching Soon")
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            HStack(spacing: 20) {
                CardView(countLabel: $viewModel.days, timeLabel: "Days")
                CardView(countLabel: $viewModel.hours, timeLabel: "Hours")
                CardView(countLabel: $viewModel.minutes, timeLabel: "Minutes")
                CardView(countLabel: $viewModel.seconds, timeLabel: "Seconds")
            }
            .padding(.horizontal)
            Spacer()
            Spacer()
            Spacer()
        }.onReceive(viewModel.timer, perform: { _ in
            viewModel.updateTimeRamaining()
        })
        .onAppear(perform: {
            viewModel.updateTimeRamaining()
        })
    }
}

#Preview {
    CountDownTimerView()
}
