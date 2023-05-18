//
//  ExploreView.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 20/05/23.
//

import SwiftUI

struct ExploreView: View {
    @State var isSelectedTab:Tabs = .individual
    @State var searchbar = ""
    @State var progressValue: Float = 0.3
    @State private var searchText = ""
    let Usernames = ["Holly", "Josh", "Rhonda", "Ted"]
    
    var UserListData:[UserList] =  UserDataList.individualUserList
    
    @State private var buttonOffset: CGSize = .zero
    
    
    var body: some View {
        VStack(){
            //Header
            ZStack {
                Rectangle()
                    .fill(Color(uiColor: UIColor(red: 15/255, green: 46/255, blue: 67/255, alpha: 1)))
                    .frame(height: 100)
                
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
                    
                    VStack{
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
            
            //Header Tabbar
            ZStack {
                Rectangle()
                    .fill(Color(uiColor: UIColor(red: 19/255, green: 61/255, blue: 89/255, alpha: 1)))
                    .frame(width: UIScreen.main.bounds.width, height: 52)
                
                //Header Tab Bar
                HStack(alignment: .center, spacing: 30.0) {
                    CustomTabBar(isSelectedTab: $isSelectedTab)
                    if isSelectedTab == Tabs.individual{
                        
                    } else if isSelectedTab == Tabs.professional{
                        
                    } else if isSelectedTab == Tabs.merchant{
                        
                    }
                }
            }
            .offset(y:-8)
            
            //Serchbar
            ZStack{
                //SearchBar
                HStack {
                    HStack(spacing: 15) {
                        Image("Search")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, 15)
                            .frame(height: 25)
                        
                        TextField("Search", text: $searchbar)
                            .padding(.vertical, 10)
                        
                    }.overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(uiColor: UIColor(red: 208/255, green: 217/255, blue: 222/255, alpha: 1)), lineWidth: 2)
                    )
                    
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
                    .cornerRadius(20)
                    
                    //Filter Image
                    Button {
                        //filter action
                    } label: {
                        Image("filter")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 15)
                            .frame(width:40, height: 40)
                    }
                    
                    
                }.padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            
            
            //User List
            
            ScrollView(showsIndicators: false) {
                ForEach(UserListData, id: \.id) { userList in
                    ZStack{
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(color:Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255).opacity(0.1), radius: 5, x: 0, y: 0)
                            .frame(width: UIScreen.main.bounds.width - 60, height: 210)

                        
                        HStack(alignment: .top){
                            Button(action: {
                                print("Invite btn")
                            }, label: {
                                Text("+ INVITE")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(uiColor: UIColor(red: 23/255, green: 64/255, blue: 91/255, alpha: 1)))
                                    .frame(maxWidth: .infinity,  alignment:.trailing)
                                    .padding(.trailing, 50)
                                    
                            })
                             
                        }.offset(y:-70)
                        .padding(.bottom, 30)
                        HStack {
                            Image("user-profile")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(15)
                                .frame(width:85, height:85, alignment: .leading)
                                .padding(.horizontal, 10)
                                .offset(x:-30, y: -25)
                            
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Michael Murphy")
                                        .font(.system(size: 14))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color(uiColor: UIColor(red: 23/255, green: 64/255, blue: 91/255, alpha: 1)))
                                        .padding(.bottom, -5)
                                        .offset(x: -30, y:-25)
                                    Text("San Francisco, with 1Km")
                                        .font(Font.custom("NATS 400", size: 15))
                                        .foregroundColor(Color(uiColor: UIColor(red: 23/255, green: 64/255, blue: 91/255, alpha: 1)))
                                        .offset(x: -30,y:-25)
                                    HStack{
                                        ProgressBar(value: $progressValue).frame(width: UIScreen.main.bounds.width / 2 ,height: 10)
                                            .offset(x: -30, y:-25)
                                        
                                    }.padding(.trailing, 20)
                                    
                                }
                            }
                        }
                        .padding(.bottom, 30)
                        VStack(alignment: .leading, spacing: 6){
                            HStack{
                                Text("Friendship |")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(uiColor: UIColor(red: 23/255, green: 64/255, blue: 91/255, alpha: 1)))
                                    .fontWeight(.heavy)
                                
                                Text("Coffee |")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(uiColor: UIColor(red: 23/255, green: 64/255, blue: 91/255, alpha: 1)))
                                    .fontWeight(.heavy)
                                Text("Hangout")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(uiColor: UIColor(red: 23/255, green: 64/255, blue: 91/255, alpha: 1)))
                                    .fontWeight(.heavy)
                            }
 
                            Text("Going to Berkley, Would love to share a ride with someone like minded.")
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 86 / 255, green: 116 / 255, blue: 136 / 255).opacity(1))
                                .lineLimit(nil)
                                .frame(width: UIScreen.main.bounds.width - 90)
                        }.padding(.bottom, 10)
                        .offset(y:55)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 210)
                    .padding(.bottom, 20)
                }
            }
        }
        .ignoresSafeArea()
        
         
    }
    
    var searchResults: [String] {
           if searchText.isEmpty {
               return Usernames
           } else {
               return Usernames.filter { $0.contains(searchText) }
           }
       }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
 
