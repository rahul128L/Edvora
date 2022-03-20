//
//  ImageView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader

    init(id: Int, url:String) {
        imageLoader = ImageLoader(id: id, urlString:url)
    }

    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .scaledToFill()
    }
}
