//
//  AddEvent.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct AddEvent: View {
    
    @StateObject var viewModel: EventsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Create event")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                 
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.evName = ""
                            viewModel.evAddress = ""
                            viewModel.evMail = ""
                            viewModel.evDate = ""
                            viewModel.evPAddIm = ""
                            viewModel.evPSelSize = ""
                            viewModel.evPChText = ""
                            viewModel.evPAddText = ""
                                                        
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
                            
                            Text("Enter info about event")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            ZStack(content: {
                                
                                Text("Client name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.evName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.evName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            
                            ZStack(content: {
                                
                                Text("Address")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.evAddress.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.evAddress)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            
                            ZStack(content: {
                                
                                Text("E-mail")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.evMail.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.evMail)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            
                            HStack {
                                
                                ZStack(content: {
                                    
                                    Text("Date")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.evDate)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                
                                Spacer()
                                
                                Image(systemName: "calendar")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            
                            Text("Select Tag")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            ForEach(viewModel.tags, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currTag = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 30)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 17)
                                                .opacity(viewModel.currTag == index ? 1 : 0)
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
                            
                            ForEach(viewModel.checklists, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currCL = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 30)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 17)
                                                .opacity(viewModel.currCL == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                    
                                })
                            }
                            
                            Text("Price Check-List")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 13) {

                                    ForEach(viewModel.PriceCheckLists, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.currPriceCkeckList = index
                                            
                                        }, label: {
                                            
                                            HStack {
                                                
                                                ZStack {
                                                    
                                                    Circle()
                                                        .fill(.white)
                                                        .frame(width: 30)
                                                    
                                                    Circle()
                                                        .fill(Color("prim"))
                                                        .frame(width: 17)
                                                        .opacity(viewModel.currPriceCkeckList == index ? 1 : 0)
                                                }
                                                
                                                Text(index)
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 18, weight: .regular))
                                            }
                                            
                                        })
                                    }
                                }
                                
                                VStack(alignment: .leading, spacing: 13) {
                                    
                                    ZStack(content: {
                                        
                                        Text("Price Select Text")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.evPSelSize.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.evPSelSize)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                    
                                    ZStack(content: {
                                        
                                        Text("Price Check Text")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.evPChText.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.evPChText)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                    
                                    ZStack(content: {
                                        
                                        Text("Price Add Text")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.evPAddText.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.evPAddText)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                    
                                    ZStack(content: {
                                        
                                        Text("Price Add Image")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.evPAddIm.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.evPAddIm)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    .padding(9)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.sumTags += 1
                            
                            if viewModel.currTag == "Posters" {
                                
                                viewModel.sumPosters += 1
                                
                            } else if viewModel.currTag == "Banners" {
                                
                                viewModel.sumBanners += 1
                                
                            } else if viewModel.currTag == "Booklet" {
                                
                                viewModel.sumBooklets += 1
                                
                            } else if viewModel.currTag == "Brochure" {
                                
                                viewModel.sumBrochures += 1
                                
                            } else if viewModel.currTag == "Menu" {
                                
                                viewModel.sumMenus += 1
                                
                            } else {
                                
                                viewModel.sumNav += 1
                                
                            }
                            
                            viewModel.evTag = viewModel.currTag
                            viewModel.evCL = viewModel.currCL
                            viewModel.evPCL = viewModel.currPriceCkeckList
                            
                            viewModel.addEvent()
                            
                            viewModel.evName = ""
                            viewModel.evAddress = ""
                            viewModel.evMail = ""
                            viewModel.evDate = ""
                            viewModel.evPAddIm = ""
                            viewModel.evPSelSize = ""
                            viewModel.evPChText = ""
                            viewModel.evPAddText = ""
                            
                            viewModel.fetchEvents()
                            
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
                        .opacity(viewModel.evName.isEmpty || viewModel.currTag.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.evName.isEmpty || viewModel.currTag.isEmpty ? true : false)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(.black.opacity(0.05)))
            }
            .padding()
        }
    }
}

#Preview {
    AddEvent(viewModel: EventsViewModel())
}
