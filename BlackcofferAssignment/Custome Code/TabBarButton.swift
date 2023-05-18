//
//  TabBarButton.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 12/04/23.
//

import SwiftUI

struct TabBarButton: View {
    var tabTitle:String
    var isActive:Bool
    
    
    
    var body: some View {
            VStack (alignment: .center) {
                Text(tabTitle)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? .white : Color(uiColor: UIColor(red: 134/255, green: 155/255, blue: 170/255, alpha: 1)))
                .frame(width:120)
                .padding(.top, 20)
                
                if isActive {
                    Capsule()
                        .fill(.white)
                        .frame(width:120, height:2)
                } else {
                    Capsule()
                        .fill(Color(uiColor: UIColor(red: 19/255, green: 61/255, blue: 89/255, alpha: 1)))
                        .frame(width:120, height:2)
                }
            }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(tabTitle: "Frequent", isActive: true)
    }
}




 
