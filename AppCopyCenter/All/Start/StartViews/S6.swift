//
//  S6.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct S6: View {

    @StateObject var viewModel = StViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("st6")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 15) {
                    
                    Text("What materials might you need photos for?")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)

                    VStack(alignment: .leading, spacing: 13) {
                        
                        ForEach(viewModel.materials, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.curMat = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(index)
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(viewModel.curMat == index ? Color("bg") : .white))
                            })
                        }
                    }
                    
                    Button(action: {
                        
                        viewModel.status = true
                        
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
    S6()
}
