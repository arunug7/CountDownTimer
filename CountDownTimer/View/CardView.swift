//
//  CardView.swift
//  CountDownTimer
//
//  Created by Arun on 27/03/24.
//

import SwiftUI

struct CardView: View {
    @Binding var countLabel: String
    var timeLabel: String
    var body: some View {
        VStack {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    Text($countLabel.wrappedValue)
                        .foregroundStyle(.red)
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .foregroundStyle(.white)
            Text(timeLabel)
                .foregroundStyle(.white)
        }
    }
}
