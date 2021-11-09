//
//  UIKitSlider.swift
//  UIKitSliderInSwiftUI
//
//  Created by Александр on 9.11.21.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    
    @Binding var targetValue: Int
    @Binding var currentValue: Float
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(.red)
            .withAlphaComponent(CGFloat(currentValue - Float(targetValue)))
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueDidChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(
            red: 212/255,
            green: 46/255,
            blue: 30/255,
            alpha: CGFloat(Float(computeScore())/100)
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(targetValue: $targetValue, currentValue: $currentValue)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        
        @Binding var targetValue: Int
        @Binding var currentValue: Float
        
        init(targetValue: Binding<Int>, currentValue: Binding<Float>) {
            self._targetValue = targetValue
            self._currentValue = currentValue
        }
        
        @objc func valueDidChanged(_ sender: UISlider) {
            currentValue = Float(sender.value)
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(targetValue: .constant(10), currentValue: .constant(10))
    }
}
