//
//  RefineView.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 18/05/23.
//

import SwiftUI

struct RefineView: View {
    //Select Status properties
    @State private var isExpanded = false
    var message = ["Away - Stay discreet and watch","Busy -Do not Disturb; Will catch Up.", "SOS - Emergency! Need Assistance!"]
    @State private var selectedmessage = "Available - Hey lets connect"
    
    //Broadcast Message
    @State var textMessage:String =  ""
    @State private var entry = ""
    let characterLimit = 250
    
    //Purpose
    @State private var selectedButtons: Set<Int> = []
    
    
    //location SLider
    @State private var sliderValue: Double = 50
//    @State private var circleOffset: CGFloat = 0
//    @State private var rectangleColor: Color = .red
    @State private var minDistance: Double = 500
    @State private var maxDistance: Double = 100
    
    var body: some View {
        ZStack{
            VStack(spacing: 15){
                //Header
                ZStack {
                    Rectangle()
                        .fill(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                        .frame(height: 100)
                        .shadow(color: Color(uiColor: UIColor(red: 173/255, green: 203/255, blue: 224/255, alpha: 1)), radius: 5, x: 0, y: 10)
                    HStack {
                        Button {
                            //Menu Button Action
                        } label: {
                            Image("Menu")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 25)
                        }
                        .padding(.leading)
                        
                        VStack() {
                            Text("Refine")
                                .font(.system(size: 18))
                                .padding(.horizontal, 2)
                                .frame(maxWidth: .infinity, alignment:.leading)
                            HStack{
                                Image("pin")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .padding(.top, -8)
                                    .padding(.trailing, -5)
                                Text("Seattle, Washington")
                                    .font(.system(size: 15))
                                    .padding(.top, -10)
                                    .frame(maxWidth: .infinity, alignment:.leading)
                            }
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bell")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                        .padding()
                    }
                    .padding(.top,30)
                }
                .frame(height: 100)
                .ignoresSafeArea()
                .foregroundColor(.white)
                
                //                Spacer()
                ScrollView(.vertical, showsIndicators: false){
                    //Select Status
                    VStack {
                        Text("Select your Status")
                            .foregroundColor(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DisclosureGroup("\(selectedmessage)", isExpanded: $isExpanded) {
                            ForEach(message, id:\.self){num in
                                Text("\(num)")
                                
                                    .font(.system(size: 18))
                                //                                    .padding(.horizontal, 10)
                                
                                    .onTapGesture {
                                        self.selectedmessage = num
                                        withAnimation{
                                            self.isExpanded.toggle()
                                        }
                                    }.frame(maxWidth: .infinity, alignment: .leading)
                                
                            }.padding(.top, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accentColor(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                        .font(.system(size: 18))
                        .foregroundColor(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(.white)
                        .cornerRadius(10)
                        .border(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)), width: 1)
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.horizontal)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .foregroundColor(Color(uiColor: UIColor(red: 208/255, green: 217/255, blue: 222/255, alpha: 1)))
                        .padding(.bottom, 10)
                    
                    //Broadcast Brief Message
                    VStack {
                        Text("Broadcast Brief Message")
                            .foregroundColor(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //Message TextFeild
                        
                        TextField("Hi Community! I met with an accident and need immediate help.", text: $textMessage, axis: .vertical)
                            .disabled(textMessage.count > (characterLimit - 1))
                        
                            .lineLimit(1...10)
                            .foregroundColor(.black)
                            .font(Font.custom("NATS 400", size: 17))
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .border(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)), width: 1)
                        
                        Text("\(textMessage.count)/250")
                            .frame(maxWidth: .infinity, alignment:.trailing)
                        
                    }.padding(.horizontal)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .foregroundColor(Color(uiColor: UIColor(red: 208/255, green: 217/255, blue: 222/255, alpha: 1)))
                        .padding(.vertical, 20)
                    
                    //Select Nearby Distance
                    VStack {
                        Text("Select Nearby Distance")
                            .foregroundColor(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //Nearby Location

                        ZStack(alignment: .leading){
                            HStack{
                                Text("\(Int(minDistance)) m")
                                    .fontWeight(.medium)
                                    .font(.system(size: 12))
                                Spacer()
                                Text("\(Int(maxDistance)) km")
                                    .fontWeight(.medium)
                                    .font(.system(size: 12))
                                
                            } .frame(width: UIScreen.main.bounds.width-80)
                                .padding(.top, 30)
                            
                            Capsule()
                                .frame(width: UIScreen.main.bounds.width-80, height: 5)
                                .foregroundColor(Color(red: 113 / 255, green: 139 / 255, blue: 154 / 255).opacity(0.5))

                            Capsule()
                                .frame(width: sliderValue, height: 5)
                                .foregroundColor(Color(red: 19 / 255, green: 61 / 255, blue: 89 / 255))
                            
                            VStack{
                                Text("\(Int(sliderValue))")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                .background(
                                    Image("message")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                ).offset(y:25)
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                Image(systemName: "circle.fill")
                            }
                           
                            
                            
                                .offset(x:sliderValue,y: -25)
                                .gesture (DragGesture() .onChanged ({ (value) in
                                    if value.location.x > 10 && value.location.x <= UIScreen.main.bounds.width - 80{
                                        sliderValue = value.location.x - 10
                                    }
                                }))
                        }
                       
                        .padding(.top, 20)
                        
                    }
                    .padding(.horizontal)
                    
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .foregroundColor(Color(uiColor: UIColor(red: 208/255, green: 217/255, blue: 222/255, alpha: 1)))
                        .padding(.vertical, 20)
                    
                    //Select Purpose
                    VStack {
                        Text("Select Purpose")
                            .foregroundColor(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        // //Select Purpose  Button Selection
                        HStack(spacing: 60){
                            VStack {
                                //Btn 1
                                Button(action: {
                                    if selectedButtons.contains(1) {
                                        selectedButtons.remove(1)
                                    } else {
                                        selectedButtons.insert(1)
                                    }
                                }) {
                                    Text("Coffee")
                                        .font(.system(size: 15))
                                    
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(1)))
                                .padding(.top, 15)
                                
                                //Btn 4
                                
                                Button(action: {
                                    if selectedButtons.contains(4) {
                                        selectedButtons.remove(4)
                                    } else {
                                        selectedButtons.insert(4)
                                    }
                                }) {
                                    Text("Friendship")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(4)))
                                .padding(.top, 15)
                                
                                //Btn 7
                                
                                Button(action: {
                                    if selectedButtons.contains(7) {
                                        selectedButtons.remove(7)
                                    } else {
                                        selectedButtons.insert(7)
                                    }
                                }) {
                                    Text("Dating")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(7)))
                                .padding(.top, 15)
                                
                            }//First row
                            
                            VStack {
                                //Btn 2
                                Button(action: {
                                    if selectedButtons.contains(2) {
                                        selectedButtons.remove(2)
                                    } else {
                                        selectedButtons.insert(2)
                                    }
                                }) {
                                    Text("Business")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(2)))
                                .padding(.top, 15)
                                //Btn 5
                                
                                Button(action: {
                                    if selectedButtons.contains(5) {
                                        selectedButtons.remove(5)
                                    } else {
                                        selectedButtons.insert(5)
                                    }
                                }) {
                                    Text("Movies")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(5)))
                                .padding(.top, 15)
                                
                                //Btn 8
                                
                                Button(action: {
                                    if selectedButtons.contains(8) {
                                        selectedButtons.remove(8)
                                    } else {
                                        selectedButtons.insert(8)
                                    }
                                }) {
                                    Text("Matrimony")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(8)))
                                .padding(.top, 15)
                            }//second row
                            
                            VStack{
                                //Btn 3
                                Button(action: {
                                    if selectedButtons.contains(3) {
                                        selectedButtons.remove(3)
                                    } else {
                                        selectedButtons.insert(3)
                                    }
                                }) {
                                    Text("Hobbies")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(3)))
                                .padding(.top, 15)
                                //Btn 6
                                
                                Button(action: {
                                    if selectedButtons.contains(6) {
                                        selectedButtons.remove(6)
                                    } else {
                                        selectedButtons.insert(6)
                                    }
                                }) {
                                    Text("Dining")
                                        .font(.system(size: 15))
                                }
                                .buttonStyle(CustomButtonStyle(isSelected: selectedButtons.contains(6)))
                                .padding(.top, 15)
                                //Btn 6
                                
                                Button(action: {
                                    
                                }) {
                                    Text("")
                                        .font(.system(size: 15))
                                } .padding(.top, 15)
                                
                            }//Third Row
                        }
                        .padding(.horizontal)
                    }
                }
//                .offset(y:-40)
                
            }
            .ignoresSafeArea()
        }
         
    }
}

struct RefineView_Previews: PreviewProvider {
    static var previews: some View {
        RefineView()
    }
}

struct CustomButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isSelected ? .white : .black)
            .background(
                Group {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(uiColor: UIColor(red: 19/255, green: 61/255, blue: 89/255, alpha: 1)))
                            .foregroundColor(.white)
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(uiColor: UIColor(red: 208/255, green: 217/255, blue: 222/255, alpha: 1)), lineWidth: 2)
                            .foregroundColor(.green)
                    }
                }
                    .frame(width: 110, height: 30)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}


//tried code one :-
//                        VStack {
//                            GeometryReader { geometry in
//
//                                ScrollView {
//                                    ZStack(alignment: .leading) {
//                                        Rectangle()
//                                            .frame(height: 4)
//                                            .foregroundColor(.gray)
//
//
//                                        Circle()
//                                            .foregroundColor(.blue)
//                                            .frame(width: 20, height: 20)
//                                            .offset(x: circleOffset)
//                                            .gesture(DragGesture(minimumDistance: 0)
//                                                .onChanged { value in
//                                            let width = geometry.size.width
//                                                    let percentage = value.location.x / width
//                                                    sliderValue = Double(percentage * 100)
//                                                    circleOffset = value.location.x
//                                                }
//                                            )
//
//                                        Text("\(Int(sliderValue))")
//                                            .background(RoundedRectangle(cornerRadius: 4).stroke()
//                                            )
//
//                                            .offset(x: circleOffset, y:-20)
//                                            .animation(.easeInOut)
//                                            .foregroundColor(.green)
//
//                                    }
//
//                                    .padding(.horizontal)
//                                }
//                                .padding(.top, 0)
//                                .padding(.trailing, 0)
//
//                            }
//                            Text("Slider Value: \(Int(sliderValue))")
//                        }
                       
//Tried code two :-
//VStack{
//    GeometryReader { geometry in
//                VStack(spacing: 0) {
//                    // Slider Section
//                    VStack {
//                        ScrollView {
//                            ZStack(alignment: .leading) {
//                                Rectangle()
//                                    .frame(height: 4)
//                                    .foregroundColor(.gray)
//
//                                Circle()
//                                    .foregroundColor(.blue)
//                                    .frame(width: 20, height: 20)
//                                    .offset(x: circleOffset)
//                                    .gesture(DragGesture(minimumDistance: 0)
//                                        .onChanged { value in
//                                            let width = geometry.size.width
//                                            let percentage = value.location.x / width
//                                            sliderValue = Double(percentage * 100)
//                                            circleOffset = value.location.x
//                                        }
//                                    )
//
//                                Text("\(Int(sliderValue))")
//                                    .background(RoundedRectangle(cornerRadius: 4).stroke())
//                                    .offset(x: circleOffset, y: -20)
//                                    .animation(.easeInOut)
//                                    .foregroundColor(.green)
//                            }
//                            .padding(.horizontal)
//                        }
//                        .padding(.top, 0)
//                        .padding(.trailing, 0)
//                    }
//                    .frame(height: geometry.size.height * 150) // Adjust the height as needed
//                    .background(.red)
//                    // Other Content
//                    Text("Slider Value: \(Int(sliderValue))")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                }
//            }
//}
