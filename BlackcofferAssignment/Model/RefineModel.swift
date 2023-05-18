//
//  RefineModel.swift
//  BlackcofferAssignment
//
//  Created by Rajni Banduni on 18/05/23.
//

import SwiftUI

class RefineModel: ObservableObject {
    //TabBar
    
}

struct UserList:Identifiable {
    var id = UUID()
    var userImage :  String
    var userName :  String
    var userLocation:String
    var userInterest_one:String
    var userInterest_two:String
    var userInterest_three:String
    var userStatus:String
}


struct UserDataList {
     
    static var individualUserList = [
        
        UserList(userImage:  "profile", userName: "Michael Murphy", userLocation: "San Francisco, with 1Km", userInterest_one: "Friendship", userInterest_two: "Coffee" , userInterest_three: "Hangout" , userStatus: "Hi Community! I am open to new connections."),
        
        
        UserList(userImage:  "profile", userName: "Michael Murphy", userLocation: "San Francisco, with 1Km", userInterest_one: "Friendship", userInterest_two: "Coffee" , userInterest_three: "Hangout" , userStatus: "Hi Community! I am open to new connections."),
        
        
        UserList(userImage:  "profile", userName: "Michael Murphy", userLocation: "San Francisco, with 1Km", userInterest_one: "Friendship", userInterest_two: "Coffee" , userInterest_three: "Hangout" , userStatus: "Hi Community! I am open to new connections."),
        
        
        UserList(userImage:  "profile", userName: "Michael Murphy", userLocation: "San Francisco, with 1Km", userInterest_one: "Friendship", userInterest_two: "Coffee" , userInterest_three: "Hangout" , userStatus: "Hi Community! I am open to new connections.")
         
    ]
}


//var header_Tab = ["INDIVIDUAL", "PROFESSIONAL","MERCHANT"]

 
