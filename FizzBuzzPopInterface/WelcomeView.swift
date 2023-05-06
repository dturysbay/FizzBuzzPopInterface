//
//  WelcomeView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 30.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var playGame: PlayGame
    
    var body: some View {

    VStack(alignment: .leading){
        HStack{
            WhiteText(text: "Are\nyou\nready?",size: 64)
                .padding(.top,100)
                .padding(.horizontal,30)
        }
        Spacer()
        Button(action: {playGame.screenState = .play}) {
            PrimaryButtonLabel(text: "Let's go")
        }
            .padding(.bottom,40)
            .padding(.horizontal)
        }
    }
}
