//
//  PhotoArray.swift
//  Netology_IB_Instruments
//
//  Created by Андрей Кузнецов on 25.03.2022.
//

import Foundation

struct PhotoArray {
    var photoArray = [String]()
    
    init() {
        for i in 1...23 {
            photoArray.append("\(i).png")
        }
    }
    
    func printArray() {
        for i in 0...22 {
            print(photoArray[i])
        }
    }
    
    subscript(row: Int) -> String {
        return photoArray[row]
    }
}

let photoArray = PhotoArray()
