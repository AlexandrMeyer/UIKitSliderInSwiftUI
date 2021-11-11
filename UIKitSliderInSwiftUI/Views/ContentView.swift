//
//  ContentView.swift
//  UIKitSliderInSwiftUI
//
//  Created by Александр on 9.11.21.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = 20
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
            HStack {
                Text("0")
                UIKitSlider(currentValue: $currentValue, alfa: computeScore(), color: .red)
                Text("100")
            }
            .padding()
            
            ButtonView(showAlert: $showAlert, title: "Проверь себя!", currentScore: computeScore()) {
                showAlert = true
            }
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ButtonView: View {
    @Binding var showAlert: Bool
    let title: String
    let currentScore: Int
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(currentScore)")
            }
    }
    
    init(showAlert: Binding<Bool> = .constant(false), title: String, currentScore: Int = 0, action: @escaping () -> Void) {
        self._showAlert = showAlert
        self.title = title
        self.currentScore = currentScore
        self.action = action
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
