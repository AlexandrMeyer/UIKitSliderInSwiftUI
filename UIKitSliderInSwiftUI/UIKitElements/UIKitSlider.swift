//
//  UIKitSlider.swift
//  UIKitSliderInSwiftUI
//
//  Created by Александр on 9.11.21.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    
    @Binding var currentValue: Float
    
    let alfa: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueDidChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alfa) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func valueDidChanged(_ sender: UISlider) {
            currentValue = Float(sender.value)
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(currentValue: .constant(10), alfa: 1, color: .red)
    }
}
