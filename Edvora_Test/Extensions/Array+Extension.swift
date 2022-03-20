//
//  Array+Extension.swift
//  Edvora_Test
//
//  Created by Rahul Chaturvedi on 20/03/22.
//

import Foundation

extension Array {
    var toPrint: String  {
        var str = ""
        for element in self {
            str += "\(element), "
        }
        return str
    }
}

