//
//  Meal.swift
//  FoodTracker
//
//  Created by kurisu on 2017/11/20.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import os.log
import UIKit

struct PropertyKey {
    static let name = "name"
    static let photo = "photo"
    static let tp = "tp"
    static let mood = "mood"
    
}

class Meal :NSObject,NSCoding{
  
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var tp:String
    var mood:Int
    //var text:String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?,tp:String,mood:Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.tp=tp
        self.mood=mood
    }
    
    //MARK: NSCoding
     func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(tp, forKey: PropertyKey.tp)
        aCoder.encode(mood, forKey: PropertyKey.mood)
     }
    
     required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name", log: OSLog.default, type: .debug)
            return nil
        }
            let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
            
       guard let tp = aDecoder.decodeInteger(forKey: PropertyKey.tp) as? String else {return nil}
        
            let mood = aDecoder.decodeInteger(forKey: PropertyKey.mood)
            
            // Must call designated initializer.
            self.init(name:name, photo: photo, tp: tp,mood:mood)
    }

}
