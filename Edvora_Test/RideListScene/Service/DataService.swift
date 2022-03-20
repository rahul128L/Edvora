//
//  DataService.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 18/03/22.
//

import Foundation

protocol DataService {
    func getRide(completion: @escaping (_ success: Bool,_ rides: [Ride]?) -> Void)
    func getUser(completion: @escaping (_ success: Bool,_ rides: User?) -> Void)
}

class AppDataService: DataService {
    
    func getRide(completion: @escaping (_ success: Bool,_ rides: [Ride]?) -> Void) {
        let urlString = "https://assessment.api.vweb.app/rides"
    
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false, nil)
            }else if let data = data {
                do {
                    let rides = try JSONDecoder().decode([Ride].self, from: data)
                    completion(true, rides)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                    completion(false, nil)
                }
            }
        }.resume()
    }
    
    func getUser(completion: @escaping (Bool, User?) -> Void) {
        let urlString = "https://assessment.api.vweb.app/user"
    
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false, nil)
            }else if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completion(true, user)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                    completion(false, nil)
                }
            }
        }.resume()
    }
    
}
