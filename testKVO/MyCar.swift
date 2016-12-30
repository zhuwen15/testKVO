//
//  MyCar.swift
//  testKVO
//
//  Created by zzw on 16/10/13.
//  Copyright © 2016年 zzw. All rights reserved.
//


import UIKit


protocol Vehicle
{
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    mutating func changeColor()
}
struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blue
    mutating func changeColor() {
        color = UIColor.red
    }
}
