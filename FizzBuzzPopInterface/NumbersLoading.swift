//
//  NumbersLoading.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 01.05.2023.
//

import SwiftUI

struct NumbersLoading: View {
    
    @ObservedObject private var focusBreakManager = FocusBreakManager(elapsedSeconds: 3)
    @EnvironmentObject var playGame: PlayGame
    
    var body: some View {
        ZStack{
            Color.secondaryGray.edgesIgnoringSafeArea(.all)
            VStack{

                ZStack{
                    GrayFrame()
                    WhiteText(text: "\(focusBreakManager.elapsedSeconds)....",size: 54)
                }
                .padding(.top,86)
                WarningText(text:"Prepare now")
                Spacer()
            }
        }
        .onAppear {
            focusBreakManager.start()
        }
        .onChange(of: focusBreakManager.timerState){ newValue in
            if(newValue == .off && focusBreakManager.elapsedSeconds == 0){
                playGame.playStates = .selectNumbers
                playGame.shaffle()
            }
        }
    }
}
