//
//  AddList.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct AddList: View {
    
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
                            
                            viewModel.chName = ""
                            viewModel.curDF = ""
                            viewModel.curPFT = ""
                            viewModel.curCkeck = ""
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
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
                            
                            ZStack(content: {
                                
                                Text("Checklist Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.chName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.chName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            
                            Text("Print File Type")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            ForEach(viewModel.fileTypes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curPFT = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 30)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 17)
                                                .opacity(viewModel.curPFT == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                    
                                })
                            }
                            
                            Text("Documents formats")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            ForEach(viewModel.fileTypes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curDF = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 30)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 17)
                                                .opacity(viewModel.curDF == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                    
                                })
                            }
                            
                            Text("Check-List")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            ForEach(viewModel.ckeck, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curCkeck = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 30)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 17)
                                                .opacity(viewModel.curCkeck == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                    
                                })
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.chDF = viewModel.curDF
                            viewModel.chPFT = viewModel.curPFT
                            viewModel.chCL = viewModel.curCkeck
                            
                            viewModel.addList()
                            
                            viewModel.chName = ""
                            viewModel.curDF = ""
                            viewModel.curPFT = ""
                            viewModel.curCkeck = ""
                            
                            viewModel.fetchLists()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                        })
                        .opacity(viewModel.chName.isEmpty || viewModel.curDF.isEmpty || viewModel.curPFT.isEmpty || viewModel.curCkeck.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.chName.isEmpty || viewModel.curDF.isEmpty || viewModel.curPFT.isEmpty || viewModel.curCkeck.isEmpty ? true : false)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(.black.opacity(0.05)))
            }
            .padding()
        }
    }
}

#Preview {
    AddList(viewModel: ListsViewModel())
}
