//
//  SettingsView.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.bottom, 30)
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    Text("Rate us")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 30).fill(.black.opacity(0.05)))
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://www.termsfeed.com/live/74afbe29-a893-4924-8173-31f710a67f26") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    Text("Privacy&Policy")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 30).fill(.black.opacity(0.05)))
                })
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
