//
//  NewSlider.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 22/05/23.
//

import SwiftUI

struct NewSlider: View {
    @State var slider:CGFloat = 0
    @Binding var goal: Int
    
    var body: some View {
        ZStack(alignment: .leading){
            Capsule()
                .frame(width: UIScreen.main.bounds.width-110, height: 5)
                .foregroundColor(Color(red: 0.863, green: 0.923, blue: 1.0))
            Capsule()
                .frame(width: slider, height: 5)
                .foregroundColor(Color(red: -0.005, green: 0.319, blue: 0.67))
            HStack(spacing: UIScreen.main.bounds.width / 30) {
                ForEach(0..<19,id: \.self){index in
                    Circle ()
                        .frame (width: 3, height: 3)
                        .foregroundColor(Color(red: 0.698, green: 0.84, blue: 1.003))
                }
            }
            
            VStack{
  
                
                Text("\(Int(slider))")
                .background(
                    Image("message")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                )
                Spacer()
                    .frame(height: 30)
                Image(systemName: "circle.fill")
                
            }
//            .frame(width: 22, height: 30)
            
                .offset(x:slider,y: -25)
                .gesture (DragGesture() .onChanged ({ (value) in
                    if value.location.x > 10 && value.location.x <= UIScreen.main.bounds.width - 110{
                        slider = value.location.x - 10
//                                print(slider)
                        goal = 400 + (Int(slider) / 17) * 200
//                                print(goal,"   ", String(Int(slider) / 17) )
                    }
                }))
        }
        .padding(.top, 20)
    }
}

struct NewSlider_Previews: PreviewProvider {
    static var previews: some View {
        NewSlider(goal: .constant(400))
    }
}
