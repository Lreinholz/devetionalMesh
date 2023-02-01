//
//  User.swift
//  PrayerApp
//
//  Created by Lyle Reinholz on 1/14/23.
//

import Foundation

class User: ObservableObject{
    @Published var friends: [Friend] = []
    
    init() { }
}

struct Friend {
    var id: Int
    var name: String
    var status: FriendStatus
}

enum FriendStatus {
    case online
    case inSession
    case offline
}
