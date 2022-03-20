//
//  Ride.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import Foundation

struct Ride: Identifiable, Decodable {
    let id: Int
    let origin_station_code: Int
    let station_path: [Int]
    let destination_station_code: Int
    let date: String
    let map_url: String
    let state: String
    let city: String
    var distance: Int?
}

extension Ride {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy h:mm a"
        let date : Date? = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: date!)
    }
}
