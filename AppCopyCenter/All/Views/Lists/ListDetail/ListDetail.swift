//
//  ListDetail.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct ListDetail: View {
    
    @StateObject var viewModel: ListsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Create checklist")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDetail = false
                                
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 13) {
                        
                        Text(viewModel.selectedList?.chName ?? "")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                        
                        Text("Print File Type")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        ForEach(viewModel.fileTypes, id: \.self) { index in
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 30)
                                    
                                    Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 17)
                                        .opacity(viewModel.selectedList?.chPFT == index ? 1 : 0)
                                }
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            
                        }
                        
                        Text("Documents formats")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        ForEach(viewModel.fileTypes, id: \.self) { index in
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 30)
                                    
                                    Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 17)
                                        .opacity(viewModel.selectedList?.chDF == index ? 1 : 0)
                                }
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            
                        }
                        
                        Text("Check-List")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        ForEach(viewModel.ckeck, id: \.self) { index in
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 30)
                                    
                                    Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 17)
                                        .opacity(viewModel.selectedList?.chCL == index ? 1 : 0)
                                }
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.black.opacity(0.05)))
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Do you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteList(withChName: viewModel.selectedList?.chName ?? "", completion: {
                                
                                viewModel.fetchLists()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.gray)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 30)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ListDetail(viewModel: ListsViewModel())
}
