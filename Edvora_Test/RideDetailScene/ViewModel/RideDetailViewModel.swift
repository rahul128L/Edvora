//
//  RideDetailViewModel.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 19/03/22.
//

import Foundation

struct Item {
    var title: String
    var value: String
}

class RideDetailViewModel {
    var ride: Ride
    
    init(ride: Ride) {
        self.ride = ride
    }
    func getDetailStacks() -> [Item] {
        let detailStacks =  [Item(title: "Ride ID", value: "\(ride.id)"),
                              Item(title: "Origin Station", value: "\(ride.origin_station_code)"),
                              Item(title: "Date", value: ride.formattedDate),
                              Item(title: "Distance", value: "\(ride.distance ?? 0) Km"),
                              Item(title: "State", value: "\(ride.state)"),
                              Item(title: "City", value: "\(ride.city)"),
                              Item(title: "Station Path", value: "\(ride.station_path.toPrint)")]
        return detailStacks
    }
}
