//
//  DevotionalMesh.swift
//  PrayerApp
//
//  Created by Lyle Reinholz on 1/14/23.
//

import SwiftUI

struct DevotionMeshView: View {
    @EnvironmentObject var sessionData: SessionData
    @StateObject var Friends = User()
    @State var animate = false
    
    let circleSize: CGFloat = 100
    
    var body: some View {
        VStack {
            
            Image("user")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 4)
                        .scaleEffect(animate ? 1.5 : 1)
                        .opacity(animate ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                )
            

            
            Spacer()
            
           Button("Start Devotional", action: {
               print("Starts devotional")
               withAnimation {
                   self.animate.toggle()
               }
           })
        }
        .padding()
    }
}
