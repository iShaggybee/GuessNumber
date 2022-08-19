//
//  ContentView.swift
//  GuessNumber
//
//  Created by Kislov Vadim on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var sliderValue: Float = 12.0
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
                .font(.footnote)
                .foregroundColor(.red)
            
            HStack {
                Text("0")
                SliderView(sliderValue: $sliderValue, thumbAlpha: computeScore())
                Text("100")
            }.padding()
            
            VStack {
                Button("Проверь меня") {
                    showingAlert.toggle()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Ваш результат"),
                        message: Text("\(computeScore())")
                    )
                }
                
                Button(action: { targetValue = Int.random(in: 0...100) }) {
                    Text("Начать заново")
                }
                .frame(height: 40, alignment: .center)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lroundf(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
