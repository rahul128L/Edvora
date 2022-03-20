//
//  ProfileView.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 19/03/22.
//

import SwiftUI


struct ProfileView: View {
    @ObservedObject var imageLoader:ImageLoader

    init(id: Int, url:String) {
        imageLoader = ImageLoader(id: id, urlString:url)
    }

    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}
