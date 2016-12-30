
//
//  lock.swift
//  testKVO
//
//  Created by zzw on 2016/10/25.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation

func synchronized(lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}
