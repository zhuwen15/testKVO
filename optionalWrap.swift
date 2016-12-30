
//
//  optionalWrap.swift
//  testKVO
//
//  Created by zzw on 2016/10/14.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation


class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Pet {
    var toy: Toy?
}
class Child {
    var pet: Pet?
}


extension Toy {
    func play() {
        //...
    } }


