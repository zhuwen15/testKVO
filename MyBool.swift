//
//  MyBool.swift
//  testKVO
//
//  Created by zzw on 2016/10/17.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation
import UIKit





enum MyBool: Int {
    case myFalse = 0, myTrue
}

extension MyBool: ExpressibleByBooleanLiteral  {
    init(booleanLiteral value: BooleanLiteralType) {
        print("value",value)
        self = value ? .myTrue : .myFalse
    }

}





