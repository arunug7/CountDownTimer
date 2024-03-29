//
//  CardView.swift
//  CountDownTimer
//
//  Created by Arun on 27/03/24.
//

import SwiftUI

struct CardView: View {
    //MARK: Properties
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
                .foregroundStyle(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8470588235)))
            Text(timeLabel)
                .foregroundStyle(.white)
        }
    }
}
