//
//  BottomTabView.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 21/05/23.
//

import SwiftUI

struct BottomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems:[(image:String, title:String)] = [
        ("refine", "Refine"),
        ("eye","Explore"),
        ("networking","Network"),
        ("chat","Chat"),
        ("contact","Contact")
    ]
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 70)
                .foregroundColor(Color(.secondarySystemBackground))
//                .shadow(radius: 2)
                .shadow(color: Color(uiColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)), radius: 5, x: 5, y: 4)
            
            HStack{
                ForEach(0..<5, id:\.self){ index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8){
                            Spacer()
                            Image(tabBarItems[index].image)
                            Text(tabBarItems[index].title)
                                .font(.caption)
                            
                            
                            if index + 1 == tabSelection{
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color(red: 113 / 255, green: 139 / 255, blue: 154 / 255))
                                    .matchedGeometryEffect(id: "SelecedTabId", in: animationNamespace)
                                    .offset(y:3)
                            } else {
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color(red: 113 / 255, green: 139 / 255, blue: 154 / 255))
                                    .offset(y:3)
                                
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? Color(red: 19 / 255, green: 61 / 255, blue: 89 / 255) : Color(red: 113 / 255, green: 139 / 255, blue: 154 / 255))
                    }

                }
            }.padding(.horizontal, 20)
            .frame(height: 70)
            .clipShape(Rectangle())
            
        }
//        .padding(.horizontal)
    }
       
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView(tabSelection: .constant(1))
//            .previewLayout(.sizeThatFits)
//            .padding(.vertical)
    }
}
//Icon image color :-  113 139 154 :- #718B9A
// icon image color on select mode :- 19 61 89 :- #133D59

 

