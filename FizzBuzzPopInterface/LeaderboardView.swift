//
//  LeaderboardView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 03.05.2023.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var playGame: PlayGame
    var body: some View {
        NavigationView {
            ZStack{
                Color.secondaryGray.edgesIgnoringSafeArea(.all)
                VStack{
                    
                }
            }
            .navigationTitle("Leaderboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading){
                    ChevronLeftToolbar()
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
