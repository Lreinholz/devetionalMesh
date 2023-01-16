//
//  LoginView.swift
//  PrayerApp
//
//  Created by Lyle Reinholz on 1/14/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var sessionData: SessionData
    
    var body: some View {
        VStack {
            Button("Validate", action: {
                sessionData.userLogin()
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

