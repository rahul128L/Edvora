//
//  RideViewModel.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import Foundation

class RideViewModel: ObservableObject {
    @Published var rides = [Ride]()
    
    let dataService: DataService
    var user: User?
    
    init(dataService: DataService = AppDataService()) {
        self.dataService = dataService
    }
    
    var segments: [SegmentViewModel] {
        return [SegmentViewModel(id: 0, title: "Nearest", count: rides.count, isSelected: true),
                SegmentViewModel(id: 1, title: "Upcoming", count: 0, isSelected: false),
                SegmentViewModel(id: 2, title: "Past", count: 0, isSelected: false)]
    }
    
    func getUser() {
        dataService.getUser { [weak self] success, user in
            guard success,
                  (user != nil) else {
                return
            }
            DispatchQueue.main.async {
                self?.user = user
                self?.getRides()
            }
        }
    }
    
    func getRides() {
        dataService.getRide(completion: { [weak self] success, rides in
            guard success,
                let rides = rides else {
                self?.rides = []
                return
            }
            self?.arrangeRide(with: rides)
        })
    }
    
    func arrangeRide(with rides: [Ride]) {
        guard let stationCode = user?.station_code else {
                self.rides = rides
            return
        }
        var ridesWithDistance: [Ride] = []
        rides.forEach {
            let distance = abs(($0.station_path.reduce($0.station_path[0]) { abs($0 - stationCode) < abs($1 - stationCode) ? $0 : $1 }) - stationCode)
            ridesWithDistance.append(Ride(id: $0.id, origin_station_code: $0.origin_station_code, station_path: $0.station_path, destination_station_code: $0.destination_station_code, date: $0.date, map_url: $0.map_url, state: $0.state, city: $0.city, distance: distance))
        }
        let sorted = ridesWithDistance.sorted(by: { $0.distance ?? 0 < $1.distance ?? 0 })
        DispatchQueue.main.async {
            self.rides = sorted
        }
    }
}
