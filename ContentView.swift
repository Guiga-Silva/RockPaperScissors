//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Guilherme Silva on 06/02/23.
//

import SwiftUI

struct RockPaperScissorsButton: View {
    var option: String
    
    var body: some View {
        HStack {
            Image(option)
                .renderingMode(.original)
        }
        .frame(maxWidth: 100)
        .padding(.vertical, 10)
        .background(Color(uiColor: UIColor(red: 0.69, green: 0.77, blue: 0.84, alpha: 1.00)))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 30)
    }
}

struct ContentView: View {
    
    let choices = ["rock", "paper", "scissors"].shuffled()
    let winLose = ["WIN", "LOSE"].shuffled()
    
    @State private var score = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var roundNumber = 1
    
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                .init(color: Color(uiColor: UIColor(red: 0.79, green: 0.13, blue: 0.26, alpha: 1.00)), location: 0.5),
                .init(color: Color(uiColor: UIColor(red: 0.47, green: 0.73, blue: 0.85, alpha: 1.00)), location: 0.5)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            Text(winLose[0])
                .font(.largeTitle.bold())
                .foregroundColor(winLose[0] == "WIN" ? .green : .red)
                .frame(maxWidth: 130, maxHeight: 60)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 13))
                .position(x: 200, y: 370)
            
            VStack {
                Text("Round: \(roundNumber)/10")
                    .font(.largeTitle)
                    .fontDesign(.default)
                    .foregroundColor(.black)
                
                Spacer()
                
                RockPaperScissorsButton(option: choices[0])
                    .frame(maxWidth: 118, maxHeight: 118)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Spacer()

                ZStack {
                    HStack {
                        ForEach(1..<3) { option in
                            Spacer()
                            
                            Button {
                                buttonTapped(winLose[0], choices[option])
                            } label: {
                                RockPaperScissorsButton(option: choices[option])
                            }
                            
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: 240, maxHeight: 116)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 20)
                .padding(.vertical, 20)

                Spacer()
            }
        }
    }
    
    func buttonTapped(_ winLose: String, _ option: String) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
