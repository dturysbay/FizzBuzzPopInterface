//
//  ContentView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 30.04.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var playGame = PlayGame()
    
    var body: some View {
        ZStack{
            Color.secondaryGray.edgesIgnoringSafeArea(.all)
            Group{
                switch playGame.screenState {
                case .welcomePage:
                    WelcomeView()
                case .play:
                    MainView()
                case .settings:
                    SettingsView()
                case .configure:
                    ConfigureView(value: playGame.configureViewValue)
                case .leaderboard:
                    LeaderboardView()
                }
            }
        }
        .environmentObject(playGame)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
