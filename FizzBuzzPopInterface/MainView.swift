//
//  PlayView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 30.04.2023.
//

import SwiftUI

struct MainView: View {
@EnvironmentObject var playGame: PlayGame

init(){
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
}

var body: some View {
    VStack{
        
        NavigationView {
            
            VStack{
//                Group{
//                    if playGame.playStates == .selectNumbers{
//                        TimerPlayground()
//                            .padding(.top,54)
//                    }
//                }
//                
                
                Group{
                    switch playGame.playStates {
                    case .numbersLoading:
                        NumbersLoading()
                    case .selectNumbers:
                        SelectNumbers()
                    case .showResults:
                        ResultView()
                    }
                }
            }
            .navigationTitle("Round \(playGame.roundCount)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Text("Settings")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primaryYellow)
                        .onTapGesture {
                            playGame.screenState = .settings
                        }
                }
            }
        }
       
        HStack(spacing: 20){
            Group{
                if(playGame.playStates != .showResults){
                    Button{
                        playGame.playStates = .numbersLoading
                    }label: {
                        CircleButton(imageName: "arrow.clockwise")
                    }
                }
            }

                Group{
                    if playGame.playStates == .numbersLoading{
                        PrimaryButtonLabel(text: "Numbers loading...",color: Color.secondaryYellow)
                    }else if playGame.playStates == .showResults{
                        Button(action: {
                            playGame.roundCount = 1
                            playGame.playStates = .numbersLoading
                            playGame.restartTimer()
                        }) {
                            PrimaryButtonLabel(text: "Play again",color: Color.primaryYellow)
                        }
                    }
                    else{
                        if playGame.setOfNumbersMetRequirements.count != 0 {
                            PrimaryButtonLabel(text: "Choose all numbers",color: Color.secondaryYellow)
                        }else if(playGame.setOfNumbersMetRequirements.count == 0 && playGame.roundCount < playGame.round){
                            Button(action: {
                                playGame.roundCount += 1
                                playGame.playStates = .numbersLoading
                            }) {
                                PrimaryButtonLabel(text: "Next Round",color: Color.primaryYellow)
                            }
                        }else if(playGame.roundCount == playGame.round){
                                Button(action: {
                                    playGame.playStates = .showResults
                                    playGame.playedTime = playGame.interval.format(using: [.hour, .minute, .second])
                                    playGame.printPlayedTime()
                                }) {
                                    PrimaryButtonLabel(text: "Final Round",color: Color.primaryYellow)
                                }
                            }
                        }

                    }
                Group{
                    Button(action: {
                        playGame.screenState = .leaderboard
                    }) {
                        CircleButton(imageName: "star")
                    }
                }
            }

        }
        .padding(.horizontal,37)
        .padding(.bottom,40)
    }

}

