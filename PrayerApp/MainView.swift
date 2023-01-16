//
//  MainView.swift
//  PrayerApp
//
//  Created by Lyle Reinholz on 1/14/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var sessionData = SessionData()
    
    var body: some View {
        ZStack {
            if (!sessionData.isAuthenicated) {
                LoginView().environmentObject(sessionData)
                    
            } else {
                DevotionMeshView()
            }
        }
    }
}
