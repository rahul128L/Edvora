//
//  SegmentedView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 20/03/22.
//

import SwiftUI

struct SegmentViewModel: Identifiable {
    
    var id: Int
    var title: String
    var count: Int
    var isSelected: Bool
    
    mutating func update(count: Int) {
        self.count = count
    }
    
    var titleAndCount: String {
        guard count > 0 else {
            return title
        }
        return "\(title) (\(count))"
    }
}

struct SegmentedView: View {
    
    var segmentModels: [SegmentViewModel] = []

    var body: some View {
        HStack {
            ForEach(segmentModels, id: \.id) { segmentModel in
                Segment(model: segmentModel)
            }
            Spacer()
        }
    }
}
