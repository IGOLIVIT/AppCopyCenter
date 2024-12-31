//
//  ListsView.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct ListsView: View {
    
    @StateObject var viewModel = ListsViewModel()

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Checklists")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                 
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 30)

                if viewModel.lists.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Text("There is no checklists. Click button bellow and create new")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Create New Checklist")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                        })
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.lists, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedList = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Text(index.chName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                            Text("Created")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text("\((index.chDate ?? Date()).convertDate(format: "dd.MM.yy"))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                                    .padding(1)
                                })
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchLists()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ListDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddList(viewModel: viewModel)
        })
    }
}

#Preview {
    ListsView()
}
