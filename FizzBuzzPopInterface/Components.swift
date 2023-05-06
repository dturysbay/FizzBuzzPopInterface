//
//  Components.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 30.04.2023.
//

import SwiftUI

struct PrimaryButtonLabel: View {
    let text: String
    let color: Color
    
    init(text: String, color: Color = Color.primaryYellow) {
        self.text = text
        self.color = color
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(color)
                .frame(height: 50)

            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 16))
        }
    }
}

struct WhiteText: View{
    let text: String
    let size: CGFloat
    let weight: Font.Weight
    init(text: String, size: CGFloat = 54, weight: Font.Weight = .semibold) {
        self.text = text
        self.size = size
        self.weight = weight
    }
    var body: some View{
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: size,weight: weight))
    }
}

struct GrayFrame:View{
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.primaryGray)
            .frame(height: 200)
            .padding(.horizontal,16)
    }
}

struct WarningText: View{
    let text: String
    let color: Color
    
    init(text: String, color: Color = .white) {
        self.text = text
        self.color = color
    }
    
    var body: some View{
        Text(text)
            .foregroundColor(.white)
            .opacity(color == .white ? 0.5 : 1)
            .font(.system(size: 16))
    }
}

struct CircleButton: View{
    let imageName: String
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.circleButtonBackgroundGray)
                .frame(width:40,height: 40)
            Image(systemName: imageName)
                .foregroundColor(Color.white)
        }
    }
}

struct NumbersBox: View{
    let number: Int
    @EnvironmentObject var playGame: PlayGame
    @State var didTap = false
    @State var error = false
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(!error ? (!didTap ? Color.primaryGray : Color.primaryYellow) : Color.red)
                .frame(height: 48)
                .frame(idealWidth: 80)
                
            Text("\(number)")
        }
        .onTapGesture {
            if(didTap != true){
                if(playGame.setOfNumbersMetRequirements.count == 0){
                    return
                }
                else if(playGame.setOfNumbersMetRequirements.count != 0 && playGame.setOfNumbersMetRequirements.contains(number)){
                    playGame.setOfNumbersMetRequirements.remove(number)
                    didTap = true
                }else if(!playGame.setOfNumbersMetRequirements.contains(number)){
                    error.toggle()
                }
            }
        }
    }
}

struct SettingsRow: View{
    let text: String
    let value: Int
    var body: some View{
        HStack {
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 17))
            Spacer()
            Text("\(value)")
                .foregroundColor(Color.textGray)
                .opacity(0.6)
            Image(systemName: "chevron.right")
                .foregroundColor(Color.textGray)
                .opacity(0.3)
        }
        .listRowBackground(Color.secondaryGray)
    }
}

struct TextFieldBackground: View{
    var body: some View{
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.primaryGray)
            .frame(height: 46)
    }
}


struct TimerPlayground: View {
//    @State var isTimerRunning = false
//    @State private var startTime =  Date()
//    @State var interval = TimeInterval()
    
    @EnvironmentObject var playGame: PlayGame
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color.secondaryGray.edgesIgnoringSafeArea(.all)
            Text(playGame.interval.format(using: [.hour, .minute, .second]))
                .font(Font.system(.largeTitle, design: .monospaced))
                .foregroundColor(.white)
                .onReceive(timer) { _ in
                    if playGame.isTimerRunning {
                        playGame.interval = Date().timeIntervalSince(playGame.startTime)
                    }
                }
        }
        .frame(height:500)
             .onAppear() {
                 if !playGame.isTimerRunning && playGame.playStates == .selectNumbers {
                     playGame.startTime = Date()
                 }
                 
//                 if playGame.playStates == .selectNumbers{
//                     playGame.isTimerRunning.toggle()
//                 }
//
             }
    }
    
}

struct ChevronLeftToolbar: View{
    @EnvironmentObject var playGame: PlayGame
    var body: some View {
        Image(systemName: "chevron.left")
            .font(.system(size: 16))
            .foregroundColor(Color.primaryYellow)
            .onTapGesture {
                playGame.screenState = .play
                playGame.playStates = .numbersLoading
            }
        
    }
}
