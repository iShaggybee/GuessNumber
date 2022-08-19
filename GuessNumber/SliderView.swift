//
//  SliderView.swift
//  GuessNumber
//
//  Created by Kislov Vadim on 19.08.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var sliderValue: Float
    
    var thumbAlpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()

        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: CGFloat(thumbAlpha) / 100
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func changeValue(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(12.0), thumbAlpha: 12)
    }
}
