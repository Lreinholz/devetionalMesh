//
//  SessionData.swift
//  PrayerApp
//
//  Created by Lyle Reinholz on 1/14/23.
//

import Foundation
import SwiftUI


class SessionData: ObservableObject {
    @Published var isAuthenicated: Bool = false
    @Published var userID: Int? // this will probably go in an idnentity file
    
    init() {
        
    }
    
    func userLogout() {
        isAuthenicated = false
    }
    
    func userLogin() {
        print("User Login")
        isAuthenicated = true
    }
}
