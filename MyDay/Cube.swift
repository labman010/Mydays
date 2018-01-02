//
//  Cube.swift
//  demo1
//
//  Created by kurisu on 2018/1/1.
//  Copyright © 2018年 Apple Inc. All rights reserved.
//

import Foundation
class ShopItem: NSObject {
   
    var q_pic_url = ""
    var z_pic_url = ""
 
    init(dict : [String : AnyObject]) {
        super.init()
  
        setValuesForKeys(dict)
    }
   
    func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
