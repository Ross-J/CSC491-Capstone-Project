//
//  HomeView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/14/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        
        var currentDate = Date()
        
        VStack (spacing: 20) {
            HStack {
                Text("Today")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding()
                Button {
                    print(currentDate)
                    currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                    print(currentDate)
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .frame(width: 30)
                }
                Button {
                    // action
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            
            HStack {
                VStack {
                    Text(currentDate.formatted(.dateTime .month() .day()))
                        .font(.title)
                        .fontWeight(.bold)
                    Text(currentDate.formatted(.dateTime .year()))
                        .fontWeight(.bold)
                }
                .frame(width: 125, height: 125)
                .background(Color(.appGreen))
                .foregroundColor(.white)
                .cornerRadius(8.0)
                Spacer()
                VStack {
                    HStack {
                        Text("Today's Tasks")
                            .bold()
                            .underline()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .frame(width: 210, height: 125)
                .background(.appGray.opacity(10))
                .foregroundColor(.appGreen)
                .cornerRadius(8.0)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            
        
            HStack {
                VStack {
                    HStack {
                        Text("Today's Notes")
                            .bold()
                            .underline()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .frame(width: 275, height: 125)
                .background(.appGray.opacity(10))
                .foregroundColor(.appGreen)
                .cornerRadius(8.0)
                Spacer()
            }
            .padding(.leading, 20)
            
            
            HStack {
                VStack {
                    HStack {
                        Text("Today's Goals")
                            .bold()
                            .underline()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .frame(width: 225, height: 125)
                .background(.appGray.opacity(10))
                .foregroundColor(.appGreen)
                .cornerRadius(8.0)
                Spacer()
            }
            .padding(.leading, 20)
            
            Spacer()
        }
        
    }
}

#Preview {
    HomeView()
}
