//
//  ImageLoader.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
@Published var image: UIImage?
var urlString: String?
var id: Int
var imageCache = ImageCache.getImageCache()

    init(id: Int, urlString: String?) {
        self.id = id
        self.urlString = urlString
        loadImage()
}

func loadImage() {
    if loadImageFromCache() {
        return
    }
    loadImageFromUrl()
}

func loadImageFromCache() -> Bool {
    guard let urlString = urlString else {
        return false
    }
    
    guard let cacheImage = imageCache.get(forKey: urlString) else {
        return false
    }
    
    image = cacheImage
    return true
}

func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            self.imageCache.set(forKey: "\(self.id)", image: loadedImage)
            self.image = loadedImage
        }
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()

    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }

    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
