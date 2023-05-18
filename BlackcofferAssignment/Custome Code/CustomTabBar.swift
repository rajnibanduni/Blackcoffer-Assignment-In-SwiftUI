//
//  CustomTabBar.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 12/04/23.
//

import SwiftUI

enum Tabs:Int{
    case individual = 0
    case professional = 1
    case merchant = 2
 
}

struct CustomTabBar: View {
    @Binding var isSelectedTab:Tabs
     
    @State var isSelectedTab1:Tabs = .individual
    @Namespace var animation
    
    var body: some View {
        HStack(alignment: .center){
        
            Button {
                isSelectedTab = .individual
            } label: {
                
                TabBarButton(tabTitle: "INDIVIDUAL", isActive: isSelectedTab == .individual)
            }.tint(Color.black)
            
            //2nd button
            Button {
                isSelectedTab = .professional
            } label: {
                TabBarButton(tabTitle: "PROFESSIONAL", isActive: isSelectedTab == .professional)
            }.tint(Color.black)
            
            //Third Button
            Button {
                isSelectedTab = .merchant
            } label: {
                TabBarButton(tabTitle: "MERCHANT", isActive: isSelectedTab == .merchant)
            }.tint(Color.black)
            
            
        }
        .background(Color(uiColor: UIColor(red: 19/255, green: 61/255, blue: 89/255, alpha: 1)))
    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(isSelectedTab: .constant(.individual))
    }
}

    //code for code file
// ZStack(alignment: .top) {
//    CustomTabBar(isSelectedTab: $isSelectedTab)
//    if isSelectedTab == Tabs.individual{
//
//    } else if isSelectedTab == Tabs.professional{
//
//    } else if isSelectedTab == Tabs.merchant{
//
//    }
//}.offset(y:-8)
