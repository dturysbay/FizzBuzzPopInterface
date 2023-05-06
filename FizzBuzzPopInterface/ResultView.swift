//
//  ResultView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 03.05.2023.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var playGame: PlayGame
    var body: some View {
        ZStack{
            Color.secondaryGray.edgesIgnoringSafeArea(.all)
            VStack{
                ZStack {
                    GrayFrame()
                    VStack{
                        WhiteText(text: "Well played",size: 54)
                        WhiteText(text: playGame.playedTime,size: 24)
                    }
                }
                Spacer()
            }.padding(.top,168)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
