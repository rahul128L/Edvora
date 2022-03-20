//
//  RideId.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct RideId: View {
    var id: Int
    
    var body: some View {
        HStack {
            Text("#")
                .fontWeight(.medium)
                .font(.subheadline)
                .foregroundColor(.blue)
            Text("\(id)")
                .fontWeight(.medium)
                .font(.subheadline)
        } .padding(.leading, 10)
    }
}

struct RideId_Previews: PreviewProvider {
    static var previews: some View {
        RideId(id: 0)
    }
}
