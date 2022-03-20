//
//  ItemsView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct ItemsView: View {
    var items: [Item]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ItemCellView(item: items[0])
                Spacer()
                ItemCellView(item: items[1])
            }
            Divider()
            HStack {
                ItemCellView(item: items[2])
                Spacer()
                ItemCellView(item: items[3])
            }
            Divider()
            HStack {
                ItemCellView(item: items[4])
                Spacer()
                ItemCellView(item: items[5])
            }
            Divider()
            HStack {
                ItemCellView(item: items[6])
            }
        }.background(Color.white)
        .frame(minWidth: 0, maxWidth: 300)
        .padding(.trailing, 20)
    }
}
