//
//  DateView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct DateView: View {
    var date: String
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(.blue)
            Text("\(date)")
                .fontWeight(.medium)
                .font(.subheadline)
        }.padding(.trailing, 10)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: "")
    }
}

