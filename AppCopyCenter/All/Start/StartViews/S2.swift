//
//  S2.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct S2: View {

    @StateObject var viewModel = StViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("st2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 15) {
                    
                    Text("Are you an individual or a legal entity?")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)

                    HStack {
                        
                        ForEach(viewModel.typesEntity, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.curEnt = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 34)
                                        
                                        Circle()
                                            .fill(Color("prim"))
                                            .frame(width: 20)
                                            .opacity(viewModel.curEnt == index ? 1 : 0)
                                    }
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .frame(maxWidth: .infinity)
                            })
                        }
                    }
                    
                    NavigationLink(destination: {
                        
                        S3()
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
    S2()
}
