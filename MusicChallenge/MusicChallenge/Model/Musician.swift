//
//  Musico.swift
//  MusicChallenge
//
//  Created by Felipe Kestelman on 11/12/18.
//  Copyright © 2018 Felipe Kestelman. All rights reserved.
//

class Musician:GenericProtocolClass {

    var name: String
    var age: Int
    var instruments: [Instrument]
    var bandID: String
    
    init(name: String, age: Int, instruments: [Instrument], bandID: String,id: String?) {
        self.name = name
        self.age = age
        self.instruments = instruments
        self.bandID = bandID
        super.init(id: id)
    }
    
    required init(asDictionary: [String : Any]) {
        self.name = asDictionary["name"] as! String
        self.age = asDictionary["age"] as! Int
        self.instruments = asDictionary["instruments"] as! [Instrument]
        self.bandID = asDictionary["bandID"] as! String
        super.init(asDictionary: asDictionary)
    }
    
}
