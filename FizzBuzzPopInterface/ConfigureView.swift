//
//  ConfigureView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 03.05.2023.
//

import SwiftUI

struct ConfigureView: View {
    @EnvironmentObject var playGame: PlayGame
    @State var value: Int 
        
    var body: some View {
        NavigationView {
            ZStack{
                Color.secondaryGray.edgesIgnoringSafeArea(.all)
                VStack(alignment:.leading){
                        Text("Name")
                            .foregroundColor(Color.white)
                            .font(.system(size: 17))
                            .padding(.bottom,12)
                            .padding(.top,26)
                    ZStack{
                        TextFieldBackground()
                        HStack{
                            Text(playGame.configureViewTitle)
                                .foregroundColor(Color.white)
                                .font(.system(size: 17))
                                .padding(.leading)
                            Spacer()
                        }
                    }
                    .padding(.bottom,32)
                    

                        Text("Number")
                            .foregroundColor(Color.white)
                            .font(.system(size: 17))

                    ZStack{
                        TextFieldBackground()
                        TextField("",value: $value,formatter: NumberFormatter())
                            .foregroundColor(.white)
                            .background(Color.primaryGray)
                            .padding(.horizontal)
                            .keyboardType(.numberPad)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationTitle("Configure")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primaryYellow)
                        .onTapGesture {
                            playGame.screenState = .settings
                        }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Text("Save")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primaryYellow)
                        .onTapGesture {
                            if(playGame.configureViewTitle == "Fizz"){
                                playGame.fizz = value
                            }else if(playGame.configureViewTitle == "Buzz"){
                                playGame.buzz = value
                            }else if(playGame.configureViewTitle == "Buzz"){
                                playGame.pop = value
                            }else if(playGame.configureViewTitle == "Rounds"){
                                playGame.round = value
                            }else if(playGame.configureViewTitle == "Numbers to select"){
                                playGame.numbersToSelect = value
                            }
                            playGame.screenState = .settings
                        }
                }
            }
        }
    }
}
