//
//  SelectNumbers.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 01.05.2023.
//

import SwiftUI

struct SelectNumbers: View {

    @EnvironmentObject var playGame: PlayGame
    let columns = [
            GridItem(),
            GridItem(),
            GridItem(),
            GridItem()
        ]

    var body: some View {
        ZStack{
            Color.secondaryGray.edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    GrayFrame()
                    WhiteText(text: "\(playGame.getRandomFizzBuzzPop[0].value.rawValue) \(playGame.getRandomFizzBuzzPop[1].value.rawValue)",size: 54)
                }
                .padding(.top,32)
                Group{
                    if playGame.setOfNumbersMetRequirements.count != 0{
                        WarningText(text:"Select \(playGame.setOfNumbersMetRequirements.count) numbers")
                    }else{
                        WarningText(text:"Correct! Proceed to the next round")
                    }
                }
                Spacer()
                Group{
                    if(playGame.numbersToSelect <= 16){
                        LazyVGrid(columns: columns) {
                            ForEach(Array(playGame.randomElements.enumerated()),id:\.offset){ (index,item) in
                                NumbersBox(number: item)
                                    .padding(.horizontal,8)
                            }
                           
                        }
                        .frame(height: 300)
                    }else{
                        ScrollView(showsIndicators: false){
                            LazyVGrid(columns: columns) {
                                ForEach(Array(playGame.randomElements.enumerated()),id:\.offset){ (index,item) in
                                    NumbersBox(number: item)
                                }
                            }
                            .frame(height: 300)
                        }
                    }
                }
                .padding(.bottom)
                .padding(.top,20)
            }
           
        }
        .onAppear(){
            playGame.isTimerRunning = true
        }
    }
}
