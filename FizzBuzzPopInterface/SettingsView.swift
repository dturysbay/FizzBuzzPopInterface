//
//  SettingsView.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 03.05.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var playGame: PlayGame
    @State var configureTitle: String = ""
    @State var configureValue: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.secondaryGray.edgesIgnoringSafeArea(.all)
                VStack{
                    List{
                        SettingsRow(text: "Rounds", value: playGame.round)
                            .onTapGesture {
                                playGame.configureViewTitle = "Rounds"
                                playGame.configureViewValue = playGame.round
                                playGame.screenState = .configure
                            }
                        SettingsRow(text: "Numbers to select", value: playGame.numbersToSelect)
                            .onTapGesture {
                                playGame.configureViewTitle = "Numbers to select"
                                playGame.configureViewValue = playGame.numbersToSelect
                                playGame.screenState = .configure
                            }
                    }
                    .listStyle(.plain)
                    .background(Color.secondaryGray)
                    .frame(height: 100)
                    
                    HStack{
                        Text("Configure")
                            .foregroundColor(.white)
                            .font(.system(size: 20,weight: .semibold))
                        Spacer()
                    }.padding()
                    List{
                        SettingsRow(text: "Fizz", value: playGame.fizz)
                            .onTapGesture {
                                playGame.configureViewTitle = "Fizz"
                                playGame.configureViewValue = playGame.fizz
                                playGame.screenState = .configure
                            }
                        SettingsRow(text: "Buzz", value: playGame.buzz)
                            .onTapGesture {
                                playGame.configureViewTitle = "Buzz"
                                playGame.configureViewValue = playGame.buzz
                                playGame.screenState = .configure
                            }
                        SettingsRow(text: "Pop", value: playGame.pop)
                            .onTapGesture {
                                playGame.configureViewTitle = "Pop"
                                playGame.configureViewValue = playGame.pop
                                playGame.screenState = .configure
                            }
                    }
                    .listStyle(.plain)
                    .background(Color.secondaryGray)
                    Spacer()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primaryYellow)
                        .onTapGesture {
                            playGame.screenState = .play
                            playGame.playStates = .numbersLoading
                        }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
