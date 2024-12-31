//
//  S1.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct S1: View {
    
    @StateObject var viewModel = StViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("st1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 15) {
                    
                    Text("Welcome!")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("Enter your name")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    ZStack(content: {
                        
                        Text("name")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.addName.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.bottom)
                    
                    NavigationLink(destination: {
                        
                        S2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.7)))
                .padding()
            }
        }
    }
}

#Preview {
    S1()
}
