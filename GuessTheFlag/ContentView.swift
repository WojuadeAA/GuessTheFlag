//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Wojuade Abdul Afeez on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    let totalQuestions = 8
   @State private var currentQuestion = 1
    @State private var countries = ["Estonia", "France", "Germany", "Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
   @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private  var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var score = 0
    @State private var showGameOver = false
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red:0.1,green: 0.2, blue: 0.45), location: 0.3),
                .init(color:Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius:200  , endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                Spacer()
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                            .fontWeight(.heavy)
                        Text(countries[correctAnswer])
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    ForEach(0..<3){ number in
                        Button{
                            flagTapped(number)
                        }label: {
                            FlagView(country: countries[number])
                        }
                        
                    }.alert(scoreTitle, isPresented: $showingScore){
                    
                    
                        Button{
                            askAnotherQuestion()
                        } label: {
                            Text("Continue")
                        }
                    } message: {
                        VStack(spacing: 20){
                            Text(scoreMessage)
                            Text("Your Score is \(score)")
                                
                        }}.alert("Game over", isPresented: $showGameOver){
                            Button("Play Again!"){
                                reset()
                            }
                        }message: {
                             Text("You got \(score) out of \(totalQuestions) flags correct")
                        }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Spacer()
                Text("Your Score is \(score)")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                Spacer()
            }.padding()
        }
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreTitle = "Wrong"
            
            
        }
        scoreMessage = "That's the flag of \(countries[number])"
        showingScore = true
    }
    
    func askAnotherQuestion()
    {
        if currentQuestion < totalQuestions {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            currentQuestion += 1
            
        }else{
            showGameOver = true
        }
        
    }
    
    func reset() {
        currentQuestion = 0
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
