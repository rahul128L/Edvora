//
//  ContentView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel: RideViewModel
    
    init(viewModel: RideViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationView{
            VStack {
                HStack {
                    SegmentedView(segmentModels: viewModel.segments)
                    Button(action: {
                        
                    }, label: {
                        Image("calendar")
                        Text("Filter")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    })
                    Spacer()
                }.frame(height: 20)
                .padding(.leading, 15)
                .padding(.trailing, 15)
                List(viewModel.rides, id: \.id){ ride in
                    ZStack {
                        VStack {
                            ImageView(id: ride.id, url: ride.map_url)
                                .frame(height: 180.0)
                            DistanceView(distance: ride.distance ?? 0)
                            HStack{
                                RideId(id: ride.id)
                                Spacer()
                                DateView(date: ride.formattedDate)
                            }.frame(height: 30)
                            .background(Color.newGrey)
                        }
                        .cornerRadius(10)
                        NavigationLink(
                            destination: DetailView(viewModel: RideDetailViewModel(ride: ride))) {
                            EmptyView()
                        }
                    }
                }
            }
            .overlay(
                ProfileView(id: 0, url: "https://picsum.photos/200")
                        .padding(.trailing, 20)
                        .offset(x: 0, y: -50)
                , alignment: .topTrailing)
            .navigationTitle("Edvora")
        }
        .padding( -12.0)
        .onAppear(perform: viewModel.getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
