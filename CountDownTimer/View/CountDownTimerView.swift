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
            //Content Layer
            CountDownTimerContentLayer()
        }
        .ignoresSafeArea()
    }
}

struct CountDownTimerContentLayer: View {
    //MARK: Propereties
    @StateObject var viewModel = CountDownTimerViewModel(futureDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date())
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            Text(StringConstants.launchingMessage)
                .font(.system(size: 40))
                .foregroundStyle(.white)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            //Horizontal stacks which showing Days, Hours,Minutes and seconds
            HStack(spacing: 20) {
                CardView(countLabel: $viewModel.days, timeLabel: StringConstants.days)
                CardView(countLabel: $viewModel.hours, timeLabel: StringConstants.hours)
                CardView(countLabel: $viewModel.minutes, timeLabel: StringConstants.minutes)
                CardView(countLabel: $viewModel.seconds, timeLabel: StringConstants.seconds)
            }
            .padding(.horizontal)
            Spacer()
            Spacer()
            Spacer()
        //Subscibing Timer publisher and receiving for every second
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
