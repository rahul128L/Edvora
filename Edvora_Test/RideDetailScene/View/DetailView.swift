//
//  DetailView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct DetailView: View {
    var viewModel: RideDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                ImageView(id: viewModel.ride.id, url: viewModel.ride.map_url)
                    .cornerRadius(20)
                    .padding(10)
                    .padding(.trailing, 20)
                ItemsView(items: viewModel.getDetailStacks())
                    .cornerRadius(20)
            }
            .padding(.leading, 20)
            .background(Color.newGrey)
        }
    }
}
