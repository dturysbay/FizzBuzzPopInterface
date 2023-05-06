//
//  Controller.swift
//  FizzBuzzPopInterface
//
//  Created by Dinmukhambet Turysbay on 03.05.2023.
//

import SwiftUI


class FizzBuzzPopObj{
    let id: Int
    let value: FizzBuzzPop
    
    init(id: Int, value: FizzBuzzPop) {
        self.id = id
        self.value = value
    }
}

class LeaderboardHistory: Codable,Identifiable{
    var id: Int = 0
    let title: String
    let scoreTime: String
    
    init(title: String, scoreTime: String) {
        self.id +=  1
        self.title = title
        self.scoreTime = scoreTime
    }
}

func getRandomFizzBuzzPopArray() -> [FizzBuzzPopObj] {
    
    var arrayOfFizzBuzzPop:[FizzBuzzPopObj] = [FizzBuzzPopObj(id: 1, value: .Fizz),FizzBuzzPopObj(id: 2, value: .Buzz),FizzBuzzPopObj(id: 3, value: .Pop)]
    
    var array : [FizzBuzzPopObj] = []
    
    for _ in 1...2{
        let value = arrayOfFizzBuzzPop.randomElement()!
        array.append(value)
        if let index = arrayOfFizzBuzzPop.firstIndex(where: {$0.id == value.id}){
            arrayOfFizzBuzzPop.remove(at: index)
        }
    }
    
    let sortedArr = array.sorted{
        $0.id < $1.id
    }
    return sortedArr
    
}

class PlayGame: ObservableObject{
    @Published var playStates: PlayStates = .numbersLoading
    @Published var screenState: ScreenStates = .welcomePage
    
    @Published var randomElements: Set<Int>  = []
    @Published var getRandomFizzBuzzPop: [FizzBuzzPopObj] = []
    @Published var setOfNumbersMetRequirements: Set<Int> = []
    
    @Published var configureViewTitle: String = ""
    @Published var configureViewValue: Int = 0
    
    @Published var roundCount: Int = 1
    
    @AppStorage("fizz") var fizz: Int = 3
    @AppStorage("buzz") var buzz: Int = 5
    @AppStorage("pop") var pop: Int = 7
    @AppStorage("round") var round: Int = 3
    @AppStorage("numbersToSelect") var numbersToSelect: Int = 8
    @AppStorage("leaderboardArray") var leaderboardArray:[LeaderboardHistory] = []
    //    Timer
    @Published var isTimerRunning = false
    @Published var startTime =  Date()
    @Published var interval = TimeInterval()
    @Published var playedTime: String = "00:00:00"
    
    func restartTimer(){
        self.isTimerRunning = false
        self.startTime =  Date()
        self.interval = TimeInterval()
        self.playedTime = "00:00:00"
    }
    
    func printPlayedTime(){
        print(playedTime)
    }
    
    func shaffle(){
        self.initializeNumbersSet()
        self.getRandomFizzBuzzPop = getRandomFizzBuzzPopArray()
        self.getNumbersByRequirement()
    }
    
    func initializeNumbersSet(){
        var randomElementsTemp: Set<Int>  = []
        while(randomElementsTemp.count <= numbersToSelect && randomElementsTemp.count != numbersToSelect){
            randomElementsTemp.insert((1...40).randomElement)
        }
        randomElements = randomElementsTemp
    }
    
    func getNumbersByRequirement(){
        setOfNumbersMetRequirements.removeAll()
        for number in randomElements{
            for obj in getRandomFizzBuzzPop{
                if(obj.value == .Fizz){
                    if number % fizz == 0 {
                        setOfNumbersMetRequirements.insert(number)
                    }
                }
                if(obj.value == .Buzz){
                    if number % buzz == 0 {
                        setOfNumbersMetRequirements.insert(number)
                    }
                }
                if(obj.value == .Pop){
                    if number % pop == 0 {
                        setOfNumbersMetRequirements.insert(number)
                    }
                }
            }
        }
    }
}

class FocusBreakManager: ObservableObject {

    enum TimerState: String{
        case on = "on"
        case off = "off"
        case paused = "paused"
    }

    var timer: Timer = Timer()
    @Published var elapsedSeconds = Int()

    init(elapsedSeconds: Int) {
        self.elapsedSeconds = elapsedSeconds
    }
    
    var timerState: TimerState{
        timerRunning ? .on : .off
    }

    private var timerRunning: Bool {
        timer.isValid
    }

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.elapsedSeconds -= 1
            if self.elapsedSeconds <= 0 {
                self.timer.invalidate()
            }
        }
    }
}
