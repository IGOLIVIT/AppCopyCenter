//
//  EventDetail.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct EventDetail: View {
    
    @StateObject var viewModel: EventsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Event")
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
                        
                        Text("Info about event")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text(viewModel.selectedEvent?.evName ?? "")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                        
                        Text(viewModel.selectedEvent?.evAddress ?? "")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                        
                        Text(viewModel.selectedEvent?.evMail ?? "")
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                        
                        HStack {
                            
                            Text(viewModel.selectedEvent?.evDate ?? "")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
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
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 30)
                                    
                                    Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 17)
                                        .opacity(viewModel.selectedEvent?.evTag ?? "" == index ? 1 : 0)
                                }
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            
                        }
                        
                        Text("Check-List")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        ForEach(viewModel.checklists, id: \.self) { index in
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 30)
                                    
                                    Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 17)
                                        .opacity(viewModel.selectedEvent?.evCL ?? "" == index ? 1 : 0)
                                }
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                            
                        }
                        
                        Text("Price Check-List")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 13) {
                                
                                ForEach(viewModel.PriceCheckLists, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 30)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 17)
                                                .opacity(viewModel.selectedEvent?.evPCL ?? "" == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                    }
                                    
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 13) {
                                
                                Text(viewModel.selectedEvent?.evPSelSize ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(9)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                
                                Text(viewModel.selectedEvent?.evPChText ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(9)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                
                                Text(viewModel.selectedEvent?.evPAddText ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(9)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                                
                                Text(viewModel.selectedEvent?.evPAddIm ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(9)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(.white))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
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
    }
}

#Preview {
    EventDetail(viewModel: EventsViewModel())
}
