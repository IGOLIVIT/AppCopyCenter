//
//  EventsView.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

struct EventsView: View {

    @StateObject var viewModel = EventsViewModel()

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Events")
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
                
                if viewModel.events.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Text("There is no events. Click button bellow and create new")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Create New Event")
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
                        
                        VStack(spacing: 12) {
                            
                            Text("Events (\(viewModel.sumTags)/\(viewModel.sumTags)")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.bottom, 20)
                            
                            Text("In progress")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .semibold))
                            
                            RoundedRectangle(cornerRadius: 7)
                                .fill(.gray.opacity(0.3))
                                .frame(maxWidth: .infinity)
                                .frame(height: 4)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            VStack(spacing: 12) {
                                
                                Text("Posters (\(viewModel.sumPosters)/\(viewModel.sumTags))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.bottom, 20)
                                
                                Text("In progress")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            
                            VStack(spacing: 12) {
                                
                                Text("Banners (\(viewModel.sumBanners)/\(viewModel.sumTags))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.bottom, 20)
                                
                                Text("In progress")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                        
                        HStack {
                            
                            VStack(spacing: 12) {
                                
                                Text("Brochures (\(viewModel.sumBrochures)/\(viewModel.sumTags))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.bottom, 20)
                                
                                Text("In progress")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            
                            VStack(spacing: 12) {
                                
                                Text("Menus (\(viewModel.sumMenus)/\(viewModel.sumTags))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.bottom, 20)
                                
                                Text("In progress")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                        
                        HStack {
                            
                            VStack(spacing: 12) {
                                
                                Text("Booklet (\(viewModel.sumBooklets)/\(viewModel.sumTags))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.bottom, 20)
                                
                                Text("In progress")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            
                            VStack(spacing: 12) {
                                
                                Text("Navigation sings (\(viewModel.sumNav)/\(viewModel.sumTags))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.bottom, 20)
                                
                                Text("In progress")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 4)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                        
                        Text("Events")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.vertical)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.events, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedEvent = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Text(index.evName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                            Text("Created")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text(index.evDate ?? "")
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
            
            viewModel.fetchEvents()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EventDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddEvent(viewModel: viewModel)
        })
    }
}

#Preview {
    EventsView()
}
