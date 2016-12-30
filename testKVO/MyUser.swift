
//
//  User.swift
//  testKVO
//
//  Created by zzw on 2016/10/14.
//  Copyright © 2016年 zzw. All rights reserved.
//

import Foundation


class MyUser {
    fileprivate var name = "private"
}

extension MyUser{
    var accessPrivate: String {
        return self.name
    }
}
