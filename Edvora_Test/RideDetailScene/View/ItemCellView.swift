//
//  ItemCellView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct ItemCellView: View {
    var item: Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.title)
                .fontWeight(.medium)
                .font(.subheadline)
                .foregroundColor(Color(UIColor.lightGray))
            Text(item.value)
                .fontWeight(.medium)
                .font(.subheadline)
        }.padding(5)
    }
}
