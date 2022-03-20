//
//  DistanceView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct DistanceView: View {
    var distance: Int
    
    var body: some View {
        HStack {
            Text("\(distance) Km")
                .fontWeight(.medium)
                .font(.subheadline)
                .foregroundColor(.white)
        }.frame(width: 65, height: 22, alignment: .center)
        .background(Color.skyBlue)
        .cornerRadius(4)
        .offset(x: 100, y: 10).padding(.bottom, 15).shadow(radius: 15)
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView(distance: 0)
    }
}
