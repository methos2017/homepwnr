//
//  Item.swift
//  homepwnr
//
//  Created by methos on 10.02.17.
//  Copyright © 2017 methos. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    //  arguments
    //  name
    //  SN
    //  ViDollars
    
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random { // like php syntaxis
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            
            let randomValue = Int(arc4random_uniform(100)) // between 0 and argument value
            
            let randomSerialNumber =
                UUID().uuidString.components(separatedBy: "-").first
            
            
            //  call to designated initializer
            
            self.init(name: randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        } else {
            //  по умолчанию
            self.init(name: "", serialNumber: nil, valueInDollars:0 )
        }
    }
}
