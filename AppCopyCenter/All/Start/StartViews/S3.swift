//
//  S3.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct S3: View {

    @StateObject var viewModel = StViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("st3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 15) {
                    
                    Text("Do you do photography professionally?")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)

                    HStack {
                        
                        ForEach(viewModel.typeProf, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.curProf = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 34)
                                        
                                        Circle()
                                            .fill(Color("prim"))
                                            .frame(width: 20)
                                            .opacity(viewModel.curProf == index ? 1 : 0)
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
                        
                        S4()
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
    S3()
}
