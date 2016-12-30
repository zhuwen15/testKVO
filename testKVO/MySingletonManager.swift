//
//  MySingletonManager.swift
//  testKVO
//
//  Created by zzw on 2016/10/24.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation


class MySingletonManager {
    private static let sharedInstance = MySingletonManager.init()
    static var sharedManager: MySingletonManager {
        return sharedInstance
    }
    init() {
        print("MySingletonManagerInit")
    }
}
