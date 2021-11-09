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
            UIKitSlider(targetValue: $targetValue, currentValue: $currentValue)
                .padding()
            
            ButtonView(title: "Проверь себя!") {
                showAlert = true
            }
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(100 - abs(targetValue - lround(Double(currentValue))))")
            }
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
    
    private func thumbTintOpacity() -> Float {
        Float(targetValue) - currentValue
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
