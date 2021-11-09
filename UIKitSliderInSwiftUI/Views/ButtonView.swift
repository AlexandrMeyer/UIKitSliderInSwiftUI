//
//  ButtonView.swift
//  UIKitSliderInSwiftUI
//
//  Created by Александр on 9.11.21.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
        }
        .padding()
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Проверь себя!", action: {})
    }
}
