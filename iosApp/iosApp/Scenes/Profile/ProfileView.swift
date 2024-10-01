//
//  ProfileView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Profile")
              .font(.largeTitle)
              .fontWeight(.heavy)
            
            headerProfile()
                        
            TitleView(title: "Menu Test")
            
            CategoryMenuTestGridView()
            
            TitleView(title: "My Github")
            
            Button {
                coordinator.present(sheet: .webView(url: "https://github.com/JARNBOY"))
            } label: {
                WebView(url: URL(string: "https://github.com/JARNBOY")!)
            }
            
        }
        .background(Color(colorName: .white))
    }
    
    @ViewBuilder
    func headerProfile() -> some View {
        HStack {
            VStack(alignment: .center) {
                TitleView(title: "JARNBOY")
                
                Image(with: .myProfileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .background(.gray)
                    .clipShape(
                        Circle()
                    )
                
                Text("This app is Demo for POC KMP")
            }
            
            
            VStack(alignment: .leading) {
                Button {
                    Constants.openURLWeb(url:  "https://medium.com/@paponsmc/let-go-try-kmp-shared-logic-separate-native-ui-ui-part-ios-6289ac0967bd")
                } label: {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Medium Blog")
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    } //: HSTACK
                    .padding()
                    .background(Color.blue.cornerRadius(12))
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth: 1)
                    )
                }
                
                Button {
                    Constants.openURLWeb(url: "https://medium.com/@paponsmc")
                } label: {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Medium Profile")
                            .fontWeight(.light)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    } //: HSTACK
                    .padding()
                    .background(Color.blue.cornerRadius(12))
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth: 1)
                    )
                }
            }
        }
        .padding()

    }
}

#Preview {
    ProfileView()
}
