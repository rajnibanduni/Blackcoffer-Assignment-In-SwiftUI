//
//  slider.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 22/05/23.
//

import SwiftUI

//struct slider: View {
//    @State private var volume:Double = 0
//    @State private var distance: Double = 500 // Initial value in meters
//    private var range:ClosedRange<Double> = 500...100000
//
//
//    @State private var minimum: Int = 500
//    @State private var maximum: Int = 100
//
//
//    var body: some View {
//        VStack{
//            Text("Distance: \(formattedDistance)")
//
//            Slider(value: $distance, in: range, step: 500)
//                            .padding(.horizontal)
//                            .onChange(of: distance, perform: { _ in
//                                // Handle distance change
//                            })
//            HStack {
//                Text("\(minimum)M")
//                Spacer()
//                Text("\(maximum)Km")
//            }
//
//        }
//        .frame(width: UIScreen.main.bounds.width - 10)
//    }
//
//    //Fomrat values
//    var formattedDistance: String {
//            let kilometers = distance / 1000
//            if kilometers >= 1 {
//                return String(format: "%.0f km", kilometers)
//            } else {
//                return "\(Int(distance)) m"
//            }
//        }
//
//}


struct slider:View{
    @State private var sliderValue: Double = 50
    @State private var circleOffset: CGFloat = 0
    @State private var rectangleColor: Color = .red
    
    
    var body: some View{
//        Final code proper working except to scroll goes out of screen
        VStack(alignment: .center) {
                        GeometryReader { geometry in
                            ScrollView {
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .frame(height: 4)
                                        .foregroundColor(.gray)
        
        
                                        Circle()
                                            .foregroundColor(.blue)
                                            .frame(width: 20, height: 20)
                                            .offset(x: circleOffset)
                                            .gesture(DragGesture(minimumDistance: 0)
                                                        .onChanged { value in
                                        let width = geometry.size.width - 50
                                                            let percentage = value.location.x / width
                                                            sliderValue = Double(percentage * 100)
                                                            circleOffset = value.location.x
                                                        }
                                            )
        
        
                                    Text("\(Int(sliderValue))")
                                        .background(RoundedRectangle(cornerRadius: 4).stroke()
                                        )
        
                                        .offset(x: circleOffset, y:-30)
                                        .animation(.easeInOut)
                                        .foregroundColor(.green)
        
                                }
                                .padding(.horizontal)
                            }
                        }
//                        .frame(height: 200, alignment:.center)
//                        .background(.pink)
//                        .padding(.top, 50)
        
        
                            Text("Slider Value: \(Int(sliderValue))")
        //                        .padding()
                        }
        
        
        
    }
    
//    private func color(for value: Double) -> Color {
//        let percentage = value / 100
//        let hue = 0.6 - percentage * 0.6 // Adjust hue range as desired
//        return Color(hue: hue, saturation: 1, brightness: 1)
//    }
    
}

struct slider_Previews: PreviewProvider {
    static var previews: some View {
        slider()
    }
}


