//
//  ContentView.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray : [Int] = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
  
    @State private var score = 0
    @State private var textD = ""
    @State private var difficulty = 30
    @State private var dif = 2


    var difficultyArray = ["30", "50", "100", "500", "1000"]
    var difficultyArray1 = [30, 50, 100, 500, 1000]
    var body: some View {
        
        VStack {
            Text("Сколько вкусняшек съела Арина?")
                .multilineTextAlignment(.center)
                .font(.system(size: 30, weight: .bold))
                .padding(.bottom, 50)
           
            Text("\(firstNumber) + \(secondNumber)")
                .font(.system(size: 50, weight: .bold))
                .bold()
                .padding()
                .padding(.horizontal, 50)
                .background(LinearGradient(colors: [.red, .green, .yellow], startPoint: .top, endPoint: .bottom)).cornerRadius(30)
            
            HStack {
                
                ForEach(0..<2) {index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            
            HStack {
                ForEach(2..<4) {index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            
            
            Text("Счет: \(score)")
                .font(.system(size: 30, weight: .bold))
                .bold()
             
            
            Button("Сбросить счет") {
                score = 0
            }.padding()
            
            Text("Уровень сложности")
            
            Picker(selection: $dif, label:
                    Text("level")) {
                ForEach(0..<difficultyArray1.count) { Text("\(difficultyArray1[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            
        
            
            switch score  {
            case 3:
                Text("Ты молодец!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.red)
            case 5:
                Text("Умница!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.blue)
            case 10:
                Text("Да ты гений!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.green)
            case 15:
                Text("Класс!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.yellow)
            case 20:
                Text("Ты супер умная!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.orange)
            case 30:
                Text("Ты лучшая!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.green)
                    .padding()
                Image(systemName: "sun.max").font(.system(size: 30, weight: .bold))
                
            default:
                Text("")
            }
        }
    }


    
    func answerIsCorrect(answer: Int){
        if answer == correctAnswer {
            self.score += 1
           
        } else {
            self.score -= 1
        }
    }
    
    func generateAnswers(){
        firstNumber = Int.random(in: 1...(difficultyArray1[dif]/2))
        secondNumber = Int.random(in: 1...(difficultyArray1[dif]/2))
        var answerList = [Int]()
        
        correctAnswer = firstNumber + secondNumber
        
        for _ in 0...2 {
            answerList.append(Int.random(in: 1...difficulty))
        }
        
        answerList.append(correctAnswer)
        
        choiceArray = answerList.shuffled()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
